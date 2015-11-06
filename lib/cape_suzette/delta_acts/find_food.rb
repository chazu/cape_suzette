module CapeSuzette
  module DeltaActs
    class DeltaFindFood < Base

      # Change own location to the location of the target
      @@planboxes = [
        CapeSuzette::Planboxes::PerceiveItemsAtLocation,
        CapeSuzette::Planboxes::MoveSelfToOtherLocation
      ]

      @@goal_state = nil

      attr_accessor :agent, :target

      def initialize agent, sigma
        super agent, sigma
      end

      goal_state [:equal,
                  [:agent, :location],
                  [:target, :location]]

      
    end
  end
end
