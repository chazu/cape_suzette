module CapeSuzette
  module World
    class Location
      attr_accessor :doors, :contents, :place_contents

      def initialize name: "void",
                     contents: [],
                     place_contents: []

        @container      = nil
        @name           = name
        @contents       = contents
        @place_contents = place_contents
        @siblings       = []
        @doors          = []
      end

      def place_name
        @name
      end


      def add_room room
        @place_contents << room
        room.container = self
        # Return the room
        room
      end

      def container= container
        @container = container
      end
      
      def set_location map
        # Remove self from old room, make our container new room, add self to contents of new
        # container
        @container.contents.delete(self)

        @container = map
        @container.contents << self
      end

      def connect_to_sibling sibling
        self.doors << sibling
        sibling.doors << self
      end

      def rooms_contained
        @contents.select { |x| x.class == CapeSuzette::Maps::Base } #TODO should be testing is subclass
      end

      def people
        @contents.select { |x| x.class == CapeSuzette::Actors::Base } #TODO should be testing is subclass
      end

      def objects
        @contents.select { |x| x.class == CapeSuzette::Prop } #TODO should be testing is subclass
      end
    end
  end
end
