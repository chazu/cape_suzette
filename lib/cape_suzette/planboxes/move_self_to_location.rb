module CapeSuzette
  module Planboxes
    class MoveSelfToOtherLocation < Base
      desc "Move to another location"
      action CapeSuzette::Actions::PTrans

      precondition Proc.new { |agent, delta, sigma| delta.state.key? :destination }
      # precondition [:agent, :is, :motile]
    end
  end
end
