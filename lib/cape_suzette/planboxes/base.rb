module CapeSuzette
  module Planbox
    class Base

      @@action = nil
      @@preconditions = []
      @@postconditions = []
      @@postaction = nil

      def initialize
        if self.class == Base
          raise NotImplementedError, "Base should not be instantiated, only subclassed."
        end
      end

      def self.set_action action
        @@action = action
      end

      def self.add_precondition precondition
        @@preconditions << precondition
      end

      def self.add_postcondition postcondition
        @@postconditions << postcondition
      end

      def self.set_postaction action
        @@postaction = action
      end
      
      def action
        @@action
      end

      def preconditions
        @@preconditions
      end

      def postconditions
        @@postconditions
      end

      def postaction
        @@postaction
      end
    end
  end
end
