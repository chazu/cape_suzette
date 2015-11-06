require 'logger'

module CapeSuzette
  module Actions
    class PPerceive < Base

      @log = Logger.new(STDOUT)
      @log.level = Logger::DEBUG

      # PPerceive - Learn something via sensory perception
      def self.execute options
        options[:env].each do |triple|
          @log.info("#{options[:agent]} learns #{triple.to_s}")
          options[:agent].knowledge.add_triple
        end
    end
  end
end
