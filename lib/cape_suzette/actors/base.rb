module CapeSuzette
  module Actors
    class Base

      def initialize args
        @sigma_states = []

        @name = args[:name]
        @health = args[:health] || 0
        @hunger = args[:hunger] || 0
        @tiredness = args[:tiredness] || 0
        @loneliness = args[:loneliness] || 0
      end

      def become_hungrier
        @hunger += 1
      end

      def become_lonelier
        @loneliness += 1
      end

      def become_more_tired
        @tiredness += 1
      end

      def become_healthier
        @health += 1
      end

      def clamp_stats
        [@health, @hunger, @tiredness, @loneliness].each do |stat|
          if stat > 10
            stat == 10
          elsif stat < -10
            stat = -10
          end
        end
      end
      
      def act
      end

      def react
      end

      def enter_sigma_state sigma_state
      end
    end
  end
end
