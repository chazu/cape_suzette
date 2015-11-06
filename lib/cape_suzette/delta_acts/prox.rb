module CapeSuzette
  module DeltaActs
    class DeltaProx < Base
      # Change own location to the location of the target
      @@planboxes = [
        CapeSuzette::Planboxes::MoveSelfToOtherLocation
      ]
      @@goal_state = nil

      attr_accessor :agent, :target
      
      def initialize options
        super options

        @agent = options[:agent]
        @target = options[:target]
      end

      goal_state [:equal,
                  [:agent, :location],
                  [:target, :location]]

      
    end
  end
end
