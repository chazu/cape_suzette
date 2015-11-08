module CapeSuzette
  module DeltaActs
    class DeltaFindFood < Base

      desc "Find food"
      # Change own location to the location of the target
      @@planboxes = [
        CapeSuzette::Planboxes::PickDestination
        CapeSuzette::Planboxes::MoveSelfToOtherLocation,
        CapeSuzette::Planboxes::PerceiveItemsAtLocation,
      ]

      @@goal_state = nil

      attr_accessor :agent, :target

      def initialize agent, sigma
        super agent, sigma
      end

      goal_state Proc.new { |sigma| sigma.agent.contents.any?(x => x.properties.try(:is_food) ) }

      
    end
  end
end
