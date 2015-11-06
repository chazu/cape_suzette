module CapeSuzette
  module SigmaStates
    class Base

      attr_accessor :plan

      def initialize
        @plan = nil
      end

      def self.descendants
        @descendants ||= []
      end

      def self.inherited descendant
        descendants << descendant
      end

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
