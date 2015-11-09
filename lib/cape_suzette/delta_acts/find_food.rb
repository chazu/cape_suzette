module CapeSuzette
  module DeltaActs
    class DeltaFindFood < Base

      desc "Find food"
      # Change own location to the location of the target

      planbox CapeSuzette::Planboxes::PickDestination
      planbox CapeSuzette::Planboxes::MoveSelfToOtherLocation
      planbox CapeSuzette::Planboxes::PerceiveItemsAtLocation

      @@goal_state = nil

      attr_accessor :agent, :target

      goal_state Proc.new { |sigma| sigma.agent.contents.any? { |x| x.properties.try(:is_food) } }

      
    end
  end
end
