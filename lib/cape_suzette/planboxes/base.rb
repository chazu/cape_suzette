module CapeSuzette
  module Planboxes
    class Base

      @@name           = nil
      @@action         = nil
      @@preconditions  = []
      @@postconditions = []
      @@postaction     = nil
      @@validations    = []
      @@env_proc       = nil
      
      def initialize sigma: nil,
                     agent: nil # TODO Make this &rest keyword args OR block? options?
        @sigma = sigma
        @agent = agent
      end

      def self.validate(&block)
        @@validations << block
      end

      def self.name name
        @@name = name
      end
      
      def self.action action
        @@action = action
      end

      def self.env env_proc
        @@env_proc = env_proc
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

      def execute options
        evaluated_env = @@env_proc ? @@env_proc.call(options[:agent]) : nil
        @@action.execute options, evaluated_env
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
