require 'logger'
require 'pry'
module CapeSuzette
  module Simulation
    class Simulation

      def roll_d6
        rand(6) + 1
      end

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

        @log = Logger.new(STDOUT)
        @log.level = Logger::DEBUG

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

        # Add items
        bread_location = @world.place_contents.sample
        bread_location.contents << CapeSuzette::Items::Item.new(:bread, bread_location)

        @actors.each { |x| x.set_location @world.place_contents.sample }
      end

      def run
        30.times do
          tick
        end
      end

      def tick
        @log.info("Time passes...")
        update_actor_state
        @actors.each do |actor|
          actor.clamp_stats
          evaluate_sigma_states(actor)
          actor.act
        end
      end

      def update_actor_state
        # TODO Factor out stats into a class so we don't have to enumerate them manually
        # also so we can encapsulate the conditions which lead to those stats fluctuating [naturally]
        @actors.each do |actor|
          # Roll a 4 or higher on a d6
          if roll_d6 >= 4 && (actor.hunger < 10 && actor.hunger > -10)
            @log.debug("#{actor.name} becomes a bit hungrier (#{actor.instance_variable_get("@hunger")})")
            actor.become_hungrier
          end

          if roll_d6 >= 4 && (actor.loneliness < 10 && actor.loneliness > -10)
            @log.debug("#{actor.name} becomes a bit lonlier (#{actor.instance_variable_get("@loneliness")})")
            actor.become_lonelier
          end
        end
      end

      def evaluate_sigma_states actor
        SigmaStates::Base.descendants.each do |state|
          if state.sigma_test(actor) && !actor.sigma_states.include?(state)
            actor.sigma_states << state
            @log.info("#{actor.name} is #{state.name}")
          end
        end
      end 
    end
  end
end
