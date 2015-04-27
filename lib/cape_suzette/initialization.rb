require 'pry'

module CapeSuzette
  module Initialization

    def self.evaluate_sigma_states actor
      SigmaStates::Base.descendants.each do |state|
        if state.test actor
          actor.sigma_states << state
          puts "#{actor.name} is #{state.name} "
        end
      end
    end 

    def self.begin
      # Create objective reality graph
      reality = CapeSuzette::Graphs::Graph.new
      # Populate it with knowledgebase

      # make a couple of actors
      lou = Actors::Base.new({name: "Lou"})
      kaze = Actors::Base.new({name: "Kaze"})

      #Create a map
      world = Maps::Base.new
      room1 = world.add_room(Maps::Base.new name: "room 1")
      room2 = world.add_room(Maps::Base.new name: "room 2")
      room2.connect_to_sibling room1

      
      # Put actors in the world
      lou.set_location(room2)
      kaze.set_location(room1)

      # Activate DELTA PROX for Kaze

      # Start time!
      tell_story = true

      while tell_story
        # Update living things' biological functions
        world.people.each do |actor|
          actor.become_hungrier
          actor.clamp_stats
          evaluate_sigma_states(actor)
          actor.act
        end
      end
    end
  end
end
