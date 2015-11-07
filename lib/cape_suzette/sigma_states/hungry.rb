module CapeSuzette
  module SigmaStates
    class SigmaHunger < Base

      def name
        "Hungry"
      end

      activate_if Proc.new { |actor| actor.hunger > 5 }

      def delta_acts
        [
          DeltaActs::DeltaFindFood
        ]
      end

      parameters({ target_type: :food })

    end
  end
end
