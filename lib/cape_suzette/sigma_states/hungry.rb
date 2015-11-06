module CapeSuzette
  module SigmaStates
    class SigmaHunger < Base

      def name
        "Hungry"
      end
      
      def self.sigma_test actor
        actor.hunger > 5
      end

      def delta_acts
        [
          DeltaActs::DeltaFindFood
        ]
      end

      def parameters
        # The state to be parameterized on strategy instantiation
        # TODO This should be expressed as triples, no?
        {
          target_type: :food
        }
      end
    end
  end
end
