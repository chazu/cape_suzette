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

      place_names = [
        "brook",
        "dale",
        "ravine",
        "field",
        "grove",
        "hillside",
        "bog",
        "lakeside",
        "grotto"
      ]

      place_descriptors = [
        "shady",
        "quiet",
        "verdant",
        "humid",
        "whispering",
        "refulgent",
        "ghostly",
        "sweet-smelling",
        "secluded",
        "slippery",
        "peaceful",
        "busy"
      ]

      # Create objective reality graph
      reality = CapeSuzette::Graphs::Graph.new
      # Populate it with knowledgebase

      # make a couple of actors
      lou = Actors::Base.new({name: "Lou"})
      kaze = Actors::Base.new({name: "Kaze"})

      # TODO Shouldn't have to do this
      people = [lou, kaze]

      #Create a map
      world = World::Location.new({name: "World"})

      room_count = 5 + rand(5);
      room_count.times do
        new_room = World::Location.new({name: "#{place_names.sample} #{place_descriptors.sample}"})
        world.add_room(new_room)
        new_room.connect_to_sibling world.place_contents.sample
      end

      # Put actors in the world
      lou.set_location(world.place_contents.sample)
      kaze.set_location(world.place_contents.sample)

      # Activate DELTA PROX for Kaze
      kaze.activate_goal(DeltaActs::DeltaProx, {target: lou})

      # Start time!
      tell_story = true

      while tell_story
        # Update living things' biological functions
        people.each do |actor|
          # actor.become_hungrier
          actor.clamp_stats
          evaluate_sigma_states(actor)
          actor.act
        end
      end
    end
  end
end
