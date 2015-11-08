require 'logger'

module CapeSuzette
  module DeltaActs
    class Base

      attr_accessor :state

      @@planboxes = [
      ]

      def initialize(agent, sigma)
        @log = Logger.new(STDOUT)
        @log.level = Logger::DEBUG
        
        @agent = agent
        @sigma = sigma
        @state = {}
      end

      @@goal_state = nil

      def self.planboxes
        @@planboxes
      end
      
      def self.goal_state expression
        @@goal_state = expression
      end

      def goal_state
        @@goal_state
      end

      def self.desc description
        @@desc = description
      end

      def goal_state_achieved?
        goal_state.call(@sigma)
      end

      def contextualized_planboxes
        self.class.planboxes.map do |planbox|
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
        binding.pry
        plans = eligible_planboxes
        if plans.any?
          plan.execute({agent: @agent})
        else
          @log.info("In planbox #{@@desc} - no eligible planboxes")
        end
      end
    end
  end
end
