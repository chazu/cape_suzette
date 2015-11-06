module CapeSuzette
  module Planboxes
    class MoveSelfToOtherLocation < Base
      name "Move to location of target"
      action CapeSuzette::Actions::PTrans

      validate { |x| x.class == Actor }
      
      precondition [:is, :sentient]
      precondition [:agent, :is, :motile]
    end
  end
end
