module CapeSuzette
  module DeltaActs
    class DeltaProx
      # Change own location to the location of the target
      @@planboxes = []
      @@goal_state = nil

      goal_state [:equal,
                  [:agent, :location],
                  [:target, :location]]
    end
  end
end
