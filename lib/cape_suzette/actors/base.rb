module CapeSuzette
  module Actors
    class Base

      attr_accessor :location, :name

      def initialize args
        @name       = args[:name]
        @health     = args[:health] || 0
        @hunger     = args[:hunger] || 0
        @tiredness  = args[:tiredness] || 0
        @loneliness = args[:loneliness] || 0
        @location   = nil
        @goal_stack = []
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

      
      def activate_goal delta_class, options
        # TODO This is not idiomatic, I'm sure of it
        # ALSO TODO - We shouldn't activate goals, we should activate sigma states,
        # which instigate the search for delta acts, which then decompose into
        # planboxes, scripts, smaller delta acts or combinations of those three
        @goal_stack.push(delta_class.new({agent: self, target: options[:target]}))
      end
      
      def set_location map
        map.place_contents << self
        @location = map
      end

      def clamp_stats
        [@health, @hunger, @tiredness, @loneliness].each do |stat|
          if stat > 10
            stat == 10
          elsif stat < -10
            stat = -10
          end
        end
      end
      
      def act
        # Find the most relevant delta act
        # Try a plan
        delta = nil
        if !@goal_stack.empty?
          delta = @goal_stack[0]
        end
        if delta

          delta.execute self
          if delta.goal_state_achieved?
            @goal_stack.delete(delta)
          end
        end
      end

      def react
      end
    end
  end
end
