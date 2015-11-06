module CapeSuzette
  module SigmaStates
    class Base

      attr_accessor :plan, :agent

      def initialize(agent: actor)
        @agent = agent
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

      def self.parameters params
        @@parameters = params
      end

      def parameters
        @@parameters
      end
    end
  end
end
