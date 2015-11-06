module CapeSuzette
  module DeltaActs
    class Base
      @@planboxes = [
      ]

      def initialize(agent, sigma)
        @agent = agent
        @sigma = sigma
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
      
      def goal_state_achieved?
        goal_state.call(@sigma)
      end

      def contextualized_planboxes
        self.class.planboxes
      end

      def execute
        plans = contextualized_planboxes

        plan = plans[0].new
        
        plan.execute({agent: @agent})
      end
    end
  end
end
