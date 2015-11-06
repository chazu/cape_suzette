module CapeSuzette
  module Actions
    class PTrans < Base
      def self.execute options
        puts "#{options[:agent].name} moves from #{options[:agent].location.place_name} to #{options[:target].location.place_name}."
        options[:agent].set_location options[:target].location
      end
    end
  end
end
