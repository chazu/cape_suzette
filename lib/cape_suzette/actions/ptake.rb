require 'logger'

module CapeSuzette
  module Actions
    class PTake < Base

      @log = Logger.new(STDOUT)
      @log.level = Logger::DEBUG

      # PPerceive - Learn something via sensory perception
      def self.execute options
        # Place the target object in the agent's 'inventory'
        log.info("#{options[:agent].name} takes #{options[:target].name}")
        options[:target].location = options[:agent]
        # TODO Update agent knowledge tree - agent knows object is in their possession
      end
    end
  end
end
