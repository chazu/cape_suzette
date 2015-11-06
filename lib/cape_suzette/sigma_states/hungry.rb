module CapeSuzette
  module SigmaStates
    class SigmaHunger < Base

      def self.name
        "Hungry"
      end
      
      def self.sigma_test actor
        actor.hunger > 5
      end

      def self.delta_acts
        DeltaActs::FindFood
        DeltaActs::EatFood
      end
    end
  end
end
