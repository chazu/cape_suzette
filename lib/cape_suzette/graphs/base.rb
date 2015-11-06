require 'dag'

module CapeSuzette
  module Graphs

    PREDICATES = [
      :knows,
      :has_trait,
      :likes,
      :dislikes,
      :fears
    ]

    class Graph < DAG

      def vertex_for_object obj
        match = vertices.select { |x| x[:obj] == obj }
        !match.empty? ? match[0] : nil
      end

      def vertices_for_objects *args
        return args.map { |obj| vertex_for_object obj }
      end

      def add_vertex_for_object obj
        add_vertex obj: obj
      end

      def vertex_for_object_exists? obj
        match = vertices.select { |x| x[:obj] == obj }
        !match.empty? ? match[0] : nil
      end

      def vertices_for_objects_exist? *args
        args.all? { |x| vertex_for_object_exists? x }
      end

      def triple_exists? subject, predicate, object
        subject_vertex, object_vertex = vertices_for_objects subject, object
        if subject_vertex && object_vertex

          subject_edges_to_object = subject_vertex.outgoing_edges.select do |edge|
            edge.destination[:obj] == object
          end
          edge_with_specified_predicate = subject_edges_to_object.select do |edge|
            edge[:properties][:predicate] == predicate
          end
          !edge_with_specified_predicate.empty?
        else
          false
        end
      end
      
      def add_triple triple_array
        subject   = triple_array[0]
        predicate = triple_array[1]
        object    = triple_array[2]

        ensure_vertices_exist_for_objects subject, object
        subject_vertex, object_vertex = vertices_for_objects subject, object

        if !triple_exists? subject, predicate, object
          add_edge from: subject_vertex, to: object_vertex, properties: {predicate: predicate}
        end
      end

      # TODO Spec this sucker out pls, thx
      def remove_triple subject, predicate, object
        edges = subject.outgoing_edges.select { |edge| edge.destination[:obj] == object }
        edges.each do |edge|
          subject.outgoing_edges.delete(edge)
        end
      end

      def ensure_vertices_exist_for_objects *args
        args.each do |obj|
          if !vertex_for_object obj
            add_vertex obj: obj
          end
        end
      end
    end      
  end
end
