require 'spec_helper'

class TestDelta < CapeSuzette::DeltaActs::Base
  planbox "foo"
  planbox "bar"
end

class AnotherTestDelta < CapeSuzette::DeltaActs::Base
  planbox "quux"
  planbox "hrunkner"
end

describe CapeSuzette::DeltaActs::Base do

  context 'class methods' do
    context 'planbox' do
      it('should add a planbox to instances') do
        subject = TestDelta

        instance = subject.new "fake", "fake"

        expect(instance.planboxes.length).to eq 2
        expect(instance.planboxes[0]).to eq "foo"
        expect(instance.planboxes[1]).to eq "bar"
      end

      it('should let each subclass have its own class-level array of planboxes') do
        subject = AnotherTestDelta

        instance = subject.new "fake", "fake"

        expect(instance.planboxes.length).to eq 2
        expect(instance.planboxes[0]).to eq "quux"
        expect(instance.planboxes[1]).to eq "hrunkner"
      end
    end
  end
end
