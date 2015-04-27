require './base'

module CapeSuzette
  module Planbox
    class FooPlanbox < Base
      set_action CapeSuzette::Action::PTrans

      validate :agent, { |x| x.class == Actor }
      
      Precondition, :is, :sentient
      precondition :agent, :is, :motile
    end
  end
end

a = CapeSuzette::Planbox::FooPlanbox.new
puts a.action
