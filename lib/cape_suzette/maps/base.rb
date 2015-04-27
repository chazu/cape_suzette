module CapeSuzette
  module Maps
    class Base
      attr_accessor :contents, :doors

      def initialize options
        @container = nil
        @name      = options[:name]     || "void"
        @contents  = options[:contents] || [];
        @siblings  = [];
        @doors     = [];
      end

      def add_room room
        @contents << room
        room.container = self
      end

      def set_location map
        # Remove self from contents of old room
        # Set own location
        # 
        # Add self to contents of room
      end

      def connect_to_sibling sibling
        self. << sibling
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
