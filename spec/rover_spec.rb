require 'spec_helper'

describe Rover do
  before :each do
    @rover = Rover.new('1 2 N')
  end

  describe '#new' do
    it 'takes a string with 2 digits and a letter, and returns a Rover object' do
      @rover.should be_an_instance_of(Rover)
    end
  end
end