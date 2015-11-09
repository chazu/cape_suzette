module CapeSuzette
  module Planboxes
    class PickDestination < Base
      desc "Choose your physical destination"

      action Proc.new { |agent, delta, sigma| sigma.state[:target] = agent.location.doors.sample }
    end
  end
end
