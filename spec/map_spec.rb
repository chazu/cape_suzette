require 'spec_helper'

describe CapeSuzette::Maps::Base do

  context 'initialize' do
    subject { CapeSuzette::Maps::Base.new(name: "fnordland") }

    it 'should take optional param location_name' do
      expect(subject.place_name).to eq "fnordland"
    end

    it 'should default contents to an empty array' do
      expect(subject.place_contents).to eq []
    end
  end


end
