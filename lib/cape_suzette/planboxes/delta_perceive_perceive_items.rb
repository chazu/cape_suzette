module CapeSuzette
  module Planboxes
    class PerceiveItemsAtLocation < Base
      action CapeSuzette::Actions::PPerceive

      validate { |x| x.class == Actor }

      env Proc.new do |agent|
        agent.location.contents.map do
          [
            [contents.name, :is_colocated_with, :self]
          ]
        end
          .flatten
      end
    end
  end
end
