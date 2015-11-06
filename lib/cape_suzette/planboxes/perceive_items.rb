module CapeSuzette
  module Planboxes
    class PerceiveItemsAtLocation < Base
      action CapeSuzette::Actions::PPerceive

      validate { |x| x.class == Actor }

      # do/end don't work with Procs? 
      env Proc.new { |agent|
        agent.location.contents
          .reject { |x| x == agent }
          .map do |item|
            [item.name, :is_colocated_with, :self]
        end
      }

    end
  end
end
