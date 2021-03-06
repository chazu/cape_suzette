require 'logger'

module CapeSuzette
  module Actions
    class PPerceive < Base

      @log = Logger.new(STDOUT)
      @log.level = Logger::DEBUG

      # PPerceive - Learn something via sensory perception
      def self.execute env
        env.each do |triple|
          @log.info("#{agent} learns #{triple}")
          agent.knowledge.add_triple triple
        end
      end
    end
  end
end
