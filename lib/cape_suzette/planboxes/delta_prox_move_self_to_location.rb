module CapeSuzette
  module Planboxes
    class MoveSelfToOtherLocation < Base
      action CapeSuzette::Actions::PTrans

      validate { |x| x.class == Actor }
      
      precondition [:is, :sentient]
      precondition [:agent, :is, :motile]


    end
  end
end
