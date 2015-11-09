require 'logger'

module CapeSuzette
  module Actors
    class Base
      

      attr_accessor :knowledge,
                    :contents,
                    :sigma_states,
                    :location,
                    :name,
                    :sickness,
                    :hunger,
                    :tiredness,
                    :loneliness,
                    :fear,
                    :depression

      def initialize args

        @log = Logger.new(STDOUT)
        @log.level = Logger::DEBUG

        @knowledge  = CapeSuzette::Graphs::KnowledgeGraph.new

        @name       = args[:name]
        @sickness   = args[:sickness]   || 0
        @hunger     = args[:hunger]     || 0
        @tiredness  = args[:tiredness]  || 0
        @loneliness = args[:loneliness] || 0
        @fear       = args[:fear]       || 0
        @depression = args[:depression] || 0

        @location   = nil
        @contents   = []

        @sigma_states = []
        @goal_stack   = []
      end

      def become_hungrier
        @hunger += 1
      end

      def become_lonelier
        @loneliness += 1
      end

      def become_more_tired
        @tiredness += 1
      end

      def become_healthier
        @health += 1
      end

      def become_depressed
        @depression += 1
      end

      def become_afraid
        @fear += 1
      end

      def activate_goal delta_class, options
        # TODO This is not idiomatic, I'm sure of it
        # ALSO TODO - We shouldn't activate goals, we should activate sigma states,
        # which instigate the search for delta acts, which then decompose into
        # planboxes, scripts, smaller delta acts or combinations of those three
        @goal_stack.push(delta_class.new({agent: self, target: options[:target]}))
      end

      def set_location map
        map.contents << self
        @location = map
      end

      def clamp_stats
        [:@sickness, :@hunger, :@tiredness, :@loneliness, :@fear, :@depression].each do |stat|
          if instance_variable_get(stat) > 10
            instance_variable_set(stat, 10)
          elsif instance_variable_get(stat) < -10
            instance_variable_set(stat, -10)
          end
        end
      end

      def unhandled_sigma_states
        sigma_states.reject { |x| x.plan } # Filter out any sigmas we're acting on
      end

      def choose_strategy sigma_state # Doushio?!?
        choice = sigma_state.delta_acts[0].new(self, sigma_state)
        sigma_state.plan = choice
        @log.info("#{name} decides to #{choice.to_s}")
        choice
      end

      def act
        if unhandled_sigma_states
          unhandled_sigma_states.each do |sigma|
            @goal_stack << choose_strategy(sigma)
          end

          if !@goal_stack.empty?
            delta = @goal_stack[0]
            delta.execute
            if delta.goal_state_achieved?
              @goal_stack.delete(delta)
            end
          end
        end
      end
      
      def react
      end
    end
  end
end
