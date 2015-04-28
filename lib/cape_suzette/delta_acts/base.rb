module CapeSuzette
  module DeltaActs
    class Base
      @@planboxes = [
      ]

      def initialize(options)
        @options = options
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
        test = generate_goal_state_lambda
        test.call(self)
      end

      def contextualized_planboxes
        self.class.planboxes
      end

      def execute actor
        plans = contextualized_planboxes

        plan = plans[0].new
        
        plan.execute ({agent: actor, target: @options[:target]})
      end
      
      private
      def generate_goal_state_lambda
        gs = goal_state
        case goal_state.first
        when :equal
          Proc.new { |x| x.send(gs[1][0]).send(gs[1][1]) == x.send(gs[2][0]).send(gs[2][1]) }
        end
      end
    end
  end
end
