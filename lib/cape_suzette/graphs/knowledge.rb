module CapeSuzette
  module Graphs
    class KnowledgeGraph < Graph

      def initialize
        super
        add_triple [:bread, :is_instance, :food]
      end
    end
  end
end
