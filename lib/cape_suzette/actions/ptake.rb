require 'logger'

module CapeSuzette
  module Actions
    class PTake < Base

      @log = Logger.new(STDOUT)
      @log.level = Logger::DEBUG

      # PPerceive - Learn something via sensory perception
      def self.execute env
        # Place the target object in the agent's 'inventory'
        log.info("#{env[:agent].name} takes #{env[:target].name}")
        env[:target].location = env[:agent]
        # TODO Update agent knowledge tree - agent knows object is in their possession
      end
    end
  end
end
