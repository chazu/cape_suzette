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

      parameters({ target_type: :food })

    end
  end
end
