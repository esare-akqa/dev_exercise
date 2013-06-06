require 'spec_helper'

describe Plateau do
  before :each do
    @plateau = Plateau.new(5, 5)
    @plateau2 = Plateau.new()
  end

  describe '#new' do
    it 'is an instance of Plateau' do
      @plateau.should be_an_instance_of(Plateau)
    end
  end

  describe '#width' do
    it 'should not be nil' do
      @plateau.width.should_not equal nil
      @plateau2.width.should_not equal nil
    end
    it 'is a Fixnum' do
      @plateau.width.should be_an_instance_of(Fixnum)
    end
  end

  describe '#length' do
    it 'is a Fixnum' do
      @plateau.length.should be_an_instance_of(Fixnum)
    end
    it 'should not be nil' do
      @plateau.length.should_not equal nil
      @plateau2.length.should_not equal nil
    end
  end
end
