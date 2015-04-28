module CapeSuzette
  module Maps
    class Base
      attr_accessor :contents, :doors, :name

      def initialize args                     
        @container = nil
        @name      = args[:name]     || "void"
        @contents  = args[:contents] || [];
        @siblings  = [];
        @doors     = [];
      end

      def add_room room
        @contents << room
        room.container = self
      end

      def container= container
        @@container = container
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
