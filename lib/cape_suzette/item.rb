module CapeSuzette
  module Items
    class Item
      def initialize name, location
        @name = name
        @location = location
      end

      def name
        @name.to_sym
      end
    end
  end
end
