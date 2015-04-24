require './base'

module CapeSuzette
  module Planbox
    class FooPlanbox < Base
      set_action "shit"
    end
  end
end

a = CapeSuzette::Planbox::FooPlanbox.new
puts a.action
