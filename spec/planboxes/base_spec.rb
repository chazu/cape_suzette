require 'spec_helper'

describe CapeSuzette::Planboxes::Base do

  subject { CapeSuzette::Planboxes::Base }

  
  it 'should yell if you try to instantiate it' do
    expect { subject.new }.to raise_error(NotImplementedError)
  end

  context '::action' do
    it 'should respond to set_action' do
      expect(subject).to respond_to 'action'
    end

    it 'should set the action of the class' do
      subject.action("PUSH IT")
      expect(subject.class_variables).to include :@@action
      expect(subject.class_variable_get :@@action).to eq "PUSH IT"
    end
  end

    context '::postaction' do
    it 'should respond to set_postaction' do
      expect(subject).to respond_to 'postaction'
    end

    it 'should set the postaction of the class' do
      subject.postaction("PUSH IT")
      expect(subject.class_variables).to include :@@postaction
      expect(subject.class_variable_get :@@postaction).to eq "PUSH IT"
    end
  end

  context '::precondition' do
    it 'should respond to precondition' do
      expect(subject).to respond_to 'precondition'
    end

    it 'should add a precondition to the static array' do
      subject.precondition("You must be THIS tall to ride")
      expect(subject.class_variables).to include :@@preconditions
      expect(subject.class_variable_get :@@preconditions ).to include "You must be THIS tall to ride"
    end
  end

    context '::postcondition' do
    it 'should respond to postcondition' do
      expect(subject).to respond_to 'postcondition'
    end

    it 'should add a postcondition to the static array' do
      subject.postcondition("You must be THIS tall to ride")
      expect(subject.class_variables).to include :@@postconditions
      expect(subject.class_variable_get :@@postconditions ).to include "You must be THIS tall to ride"
    end
  end
end
