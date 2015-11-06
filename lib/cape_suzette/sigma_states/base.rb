module CapeSuzette
  module SigmaStates
    class Base

      def self.descendants
        @descendants ||= []
      end

      
      def self.inherited descendant
        descendants << descendant
      end

      # def self.all_descendants
      #   descendants.inject([]) do |all, descendant|
      #     (all << descendant) + descendant.all_descendants
      #   end
      # end

      def name
        raise NotImplementedError, "Must be implemented by subclass, fool"
      end

      def test actor
        raise NotImplementedError, "Must be implemented by subclass, fool"
      end

      def delta_acts
        raise NotImplementedError, "Must be implemented by subclass, fool"        
      end
    end
  end
end
