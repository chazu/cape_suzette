module CapeSuzette
  module DeltaActs
    class Base
      @@planboxes = []
      @@goal_state = nil

      def self.goal_state expression
        @@goal_state = expression
      end

      def goal_state_achieved?
        # TODO Parse the goal state and generate an anonymous function that
        # determines whether goal state is achieved
      end

      def contextualized_planboxes
        # TODO Sort planboxes into order of preference
      end

      private
      def generate_goal_state_lambda
        # TODO
      end
    end
  end
end
