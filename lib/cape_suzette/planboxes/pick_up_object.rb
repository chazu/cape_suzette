module CapeSuzette
  module Planboxes
    class PickUpObject < Base
      desc "Pick up an object"

      action CapeSuzette::Actions::PTake
    end
  end
end
