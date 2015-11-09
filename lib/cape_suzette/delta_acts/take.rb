module CapeSuzette
  module DeltaActs
    class DeltaTake < Base

      desc "Take possession of an object"

      planbox CapeSuzette::Planboxes::PickUpObject

      @@goal_state = nil

      attr_accessor :agent, :target

      goal_state Proc.new { |sigma| true }
    end
  end
end
