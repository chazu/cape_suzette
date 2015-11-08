module CapeSuzette
  module Actions
    class PTrans < Base
      # PTrans - Physically move yourself from place to place

      # TODO This doesn't move agents through the world, just teleports them to their destination. No good brah...
      def self.execute agent, delta, sigma
        puts "#{agent.name} moves from #{agent.location.place_name} to #{sigma.state[:target].location.place_name}."
        agent.set_location sigma.state[:target].location
      end
    end
  end
end
