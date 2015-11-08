module CapeSuzette
  module Planboxes
    class PerceiveItemsAtLocation < Base
      desc "Look at the items present at location"

      action CapeSuzette::Actions::PPerceive

      validate { |x| x.class == Actor }

      # TODO update sigma state with this, right?
      # do/end don't work with Procs? 
      env Proc.new { |agent, delta, sigma|
        agent.location.contents
          .reject { |x| x == agent }
          .map do |item|
            [item.name, :is_colocated_with, :self]
        end
      }
    end
  end
end
