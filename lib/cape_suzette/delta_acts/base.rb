require 'logger'

module CapeSuzette
  module DeltaActs
    class Base

      attr_accessor :state

      @description = ""
      @planboxes = []
      @goal_state = nil

      def initialize(agent, sigma)
        @log = Logger.new(STDOUT)
        @log.level = Logger::DEBUG
        
        @agent = agent
        @sigma = sigma
        @state = {}
      end



      # FFS this is how u do a class instance var >_<
      def self.planbox a_planbox
        @planboxes ||= [] # But why am I having to do this?
        @planboxes << a_planbox
      end

      def self.planboxes
        @planboxes
      end

      def planboxes
        self.class.planboxes
      end
      
      def self.goal_state expression
        @goal_state = expression
      end

      def self.get_goal_state
        @goal_state
      end

      def goal_state
        self.class.get_goal_state
      end

      def self.desc a_description
        @desc = a_description
      end

      def goal_state_achieved?
        goal_state.call(@sigma)
      end

      def contextualized_planboxes
        planboxes.map do |planbox|
          planbox.new agent: @agent,
                      sigma: @sigma
        end
      end

      def eligible_planboxes
        contextualized_planboxes.select do |planbox|
          planbox.preconditions.all? do |precondition|
            precondition.call(@agent, self, @sigma)
          end
        end
      end

      def execute
        plans = eligible_planboxes
        binding.pry
        if plans.any?
          plan.execute({agent: @agent})
          @log.info("!!!In planbox #{@desc} - Executing #{plan}")          
        else
          @log.info("In planbox #{@desc} - no eligible planboxes")
        end
      end
    end
  end
end
