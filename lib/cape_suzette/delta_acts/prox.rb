module CapeSuzette
  module DeltaActs
    class DeltaProx < Base

      desc "Physically move self"

      # Change own location to the location of the target
      @@planboxes = [
        CapeSuzette::Planboxes::MoveSelfToOtherLocation
      ]
      attr_accessor :agent, :target
      
      def initialize options
        super options

        @agent = options[:agent]
        @target = options[:target]
      end

      goal_state Proc.new { |sigma| sigma.agent.location == sigma.parameters.target.location }
    end
  end
end
