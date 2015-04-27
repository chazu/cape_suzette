module CapeSuzette
  module Planboxes
    class Base

      @@name           = nil
      @@action         = nil
      @@preconditions  = []
      @@postconditions = []
      @@postaction     = nil

      def initialize agent: nil,
                     subject: nil,
                     env: nil

        if self.class == Base
          raise NotImplementedError, "Base should not be instantiated, only subclassed."
        end
      end

      def self.validate
        #TODO Validate that we pass in the right args on init of subclass
      end

      def self.name name
        @@name = name
      end
      
      def self.action action
        @@action = action
      end

      def self.precondition precondition
        # TODO Validate predicate, subject and object
        @@preconditions << precondition
      end

      def self.postcondition postcondition
        @@postconditions << postcondition
      end

      def self.postaction action
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
