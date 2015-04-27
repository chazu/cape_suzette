module CapeSuzette
  module Map
    class Map
      attr_accessor :contents

      def initialize options
        @name     = options[:name]     || "void"
        @contents = options[:contents] || []
        @siblings = []
      end

      def connect_to_sibling sibling
        # TODO Add a door to another space on the current map
      end

      def doors
        @contents.select { |x| x.class == CapeSuzette::Map::Map }
      end

      def people
        @contents.select { |x| x.class == CapeSuzette::Actor }
      end

      def objects
        @contents.select { |x| x.class == CapeSuzette::Prop }
      end
    end
  end
end
