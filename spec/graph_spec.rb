require 'spec_helper'

describe CapeSuzette::Graphs::Graph do
  subject { CapeSuzette::Graphs::Graph.new }
  
  context '#vertex_exists' do
    it 'should return false on a new graph' do
      @pending
    end

    it 'should return true if it has been added' do
      @pending
    end
  end

  context '#vertex_for_object' do
    it 'should return falsey value (nil) if none exists' do
      expect(subject.vertex_for_object("your face")).to eq nil
    end

    it 'should return a vertex object if vertex exists with proper object' do
      subject.add_vertex_for_object "fnord"

      expect(subject.vertex_for_object "fnord").to be_instance_of DAG::Vertex
      expect(subject.vertex_for_object("fnord")[:obj]).to eq "fnord"
    end
  end

  context '#vertices_for_objects' do
    it 'can return multiple values' do
      subject.add_vertex obj: "foo"
      subject.add_vertex obj: "bar"

      a, b = subject.vertices_for_objects "foo", "bar"
      expect(a).to be_instance_of DAG::Vertex
      expect(b).to be_instance_of DAG::Vertex
    end

    it 'returns nil if not found' do
      expect(subject.vertices_for_objects "Loch Ness Monster").to eq [nil]
    end
  end

  context '#vertices_for_objects_exist?' do
    it 'should return false on a graph with no vertices' do
      expect(subject.vertices_for_objects_exist? "foo", "bar", "baz").to eq false
    end

    it 'should return false if only some vertices exist' do
      subject.add_vertex obj: "foo"
      expect(subject.vertices_for_objects_exist? "foo", "bar", "baz").to eq false
    end

    it 'should return true if all vertices exist' do
      subject.add_vertex obj: "foo"
      subject.add_vertex obj: "bar"
      subject.add_vertex obj: "baz"
      expect(subject.vertices_for_objects_exist? "foo", "bar", "baz").to eq true
    end
  end

  context '#add_triple' do
    it 'should create the vertices if they dont exist' do
      subject.add_triple("fnord", :is, "the best")
      expect(subject.vertex_for_object "fnord").to be_instance_of DAG::Vertex
      expect(subject.vertex_for_object "the best").to be_instance_of DAG::Vertex
    end
  end

  context '#triple_exists?' do
    it 'should return false on an empty graph' do
      expect(subject.triple_exists? "He", :is, "grumpy").to eq false
    end

    it 'should return true on a graph with the exact triple' do
      subject.add_triple("Chaz", :loves, "Nina")
      expect(subject.triple_exists?("Chaz", :loves, "Nina")).to eq true
    end

    it 'should return false if the vertices exist but the edge does not' do
      subject.add_vertex obj: "foo"
      subject.add_vertex obj: "bar"
      expect(subject.triple_exists?("foo", :loves, "bar")).to eq false
    end

    it 'should return false if the vertices and edge exist but the predicate is incorrect' do
      subject.add_triple "foo", :dislikes, "bar"
      expect(subject.triple_exists? "foo", :loves, "bar").to eq false
    end
  end
end
