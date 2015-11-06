module CapeSuzette
  module SigmaStates
    class SigmaHunger < Base

      def name
        "Hungry"
      end
      
      def test actor
        actor.hunger < -3
      end

      def delta_acts
        # DeltaActs::FindFood
        DeltaActs::EatFood
      end
    end
  end
end
