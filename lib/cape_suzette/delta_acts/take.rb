module CapeSuzette
  module DeltaActs
    class DeltaTake < Base

      @@planboxes = [
        CapeSuzette::Planboxes::PickUpObject
      ]

      @@goal_state = nil

      attr_accessor :agent, :target

      def initialize options
        super options

        @agent = options[:agent]
        @target = options[:target]
      end
    end
  end
end
