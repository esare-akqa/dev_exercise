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

  describe '#coord' do
    it 'should be an array' do
      @rover.coords.should be_an_instance_of(Array)
    end

    it 'should be an array of integers' do
      @rover.coords.each {|coord| coord.should be_an_instance_of(Fixnum)}
    end
  end

  describe '#deg' do
    it 'should be a Fixnum' do
      @rover.deg.should be_an_instance_of(Fixnum)
    end
  end
end