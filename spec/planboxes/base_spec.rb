require 'spec_helper'

describe CapeSuzette::Planbox::Base do

  subject { CapeSuzette::Planbox::Base }

  
  it 'should yell if you try to instantiate it' do
    expect { subject.new }.to raise_error(NotImplementedError)
  end

  context '::set_action' do
    it 'should respond to set_action' do
      expect(subject).to respond_to 'set_action'
    end

    it 'should set the action of the class' do
      subject.set_action("PUSH IT")
      expect(subject.class_variables).to include :@@action
      expect(subject.class_variable_get :@@action).to eq "PUSH IT"
    end
  end

    context '::set_postaction' do
    it 'should respond to set_postaction' do
      expect(subject).to respond_to 'set_postaction'
    end

    it 'should set the postaction of the class' do
      subject.set_postaction("PUSH IT")
      expect(subject.class_variables).to include :@@postaction
      expect(subject.class_variable_get :@@postaction).to eq "PUSH IT"
    end
  end

  context '::add_precondition' do
    it 'should respond to add_precondition' do
      expect(subject).to respond_to 'add_precondition'
    end

    it 'should add a precondition to the static array' do
      subject.add_precondition("You must be THIS tall to ride")
      expect(subject.class_variables).to include :@@preconditions
      expect(subject.class_variable_get :@@preconditions ).to include "You must be THIS tall to ride"
    end
  end

    context '::add_postcondition' do
    it 'should respond to add_postcondition' do
      expect(subject).to respond_to 'add_postcondition'
    end

    it 'should add a postcondition to the static array' do
      subject.add_postcondition("You must be THIS tall to ride")
      expect(subject.class_variables).to include :@@postconditions
      expect(subject.class_variable_get :@@postconditions ).to include "You must be THIS tall to ride"
    end
  end
end
