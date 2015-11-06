module CapeSuzette
  module SigmaStates
    class SigmaHunger < Base

      def name
        "Hungry"
      end
      
      def test actor
        actor.hunger > 5
      end

      def delta_acts
        DeltaActs::FindFood
        DeltaActs::EatFood
      end
    end
  end
end
