module CapeSuzette
  module Actions
    class PTrans < Base
      # PTrans - Physically move yourself from place to place

      # TODO This doesn't move agents through the world, just teleports them to their destination. No good brah...
      def self.execute env
        puts "#{env[:agent].name} moves from #{env[:agent].location.place_name} to #{env[:target].location.place_name}."
        env[:agent].set_location env[:target].location
      end
    end
  end
end
