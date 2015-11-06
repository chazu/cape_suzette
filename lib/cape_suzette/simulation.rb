module CapeSuzette
  module Simulation
    class Simulation

      @@place_names = [
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

      @@place_descriptors = [
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

      def initialize
        @reality = CapeSuzette::Graphs::Graph.new

        @kaze = Actors::Base.new({name: "Kaze"})
        @lou  = Actors::Base.new({name: "Lou"})

        @actors = [@kaze, @lou]

        @world = World::Location.new({name: "World"})

        room_count = 5 + rand(5);
        room_count.times do
          new_room = World::Location.new({name: "#{@@place_descriptors.sample} #{@@place_names.sample}"})
          @world.add_room(new_room)
          new_room.connect_to_sibling @world.place_contents.sample
        end

        @actors.each { |x| x.set_location @world.place_contents.sample }

      end

      def run
        @actors.sample.activate_goal(DeltaActs::DeltaProx, {target: @lou})
        while true
          tick
        end
      end

      def tick
        @actors.each do |actor|
          actor.clamp_stats
          evaluate_sigma_states(actor)
          actor.act
        end
      end

      def evaluate_sigma_states actor
        SigmaStates::Base.descendants.each do |state|
          if state.test actor
            actor.sigma_states << state
            puts "#{actor.name} is #{state.name}"
          end
        end
      end 
    end
  end
end
