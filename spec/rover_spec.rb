require 'spec_helper'

describe Rover do
  before :each do
    @rover = Rover.new(1, 2, 'N')
    @rover2 = Rover.new(3, 3, 'E')
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
    it 'is 90 deg if we start with North' do
      @rover.deg.should == 90
    end
  end

  describe '#turn' do
    it 'L should add 90 degs to deg' do
      @rover.turn('L')
      @rover.deg.should == 180
    end

    it 'R should subtract 90 deg to deg' do
      @rover.turn('R')
      @rover.deg.should == 0
    end

    it 'calling turn("L") or turn("R") 4 times should result with the @deg that we start with' do
      4.times {@rover.turn('L')}
      @rover.deg.should == 90
      4.times {@rover.turn('R')}
      @rover.deg.should == 90
    end

    it 'calling turn("L") 3 times should set @deg to 0 if we start with North' do
      3.times {@rover.turn('L')}
      @rover.deg.should == 0
    end

    it 'calling turn("R") 3 times should set @deg to 180 if we start with North' do
      3.times {@rover.turn('R')}
      @rover.deg.should == 180
    end

    it 'calling turn("R") 2 times should set @deg to 270 if we start with North' do
      2.times {@rover.turn('R')}
      @rover.deg.should == 270
    end
  end

  describe '#get_heading' do
    it 'return a string class' do
      @rover.get_heading.should be_an_instance_of(String)
    end

    it 'be "N" if we start with 90' do
      @rover.get_heading.should == 'N'
    end
    it 'rover2 should be "E" if we start with 0' do
      @rover2.get_heading.should == 'E'
    end
  end

  describe '#status' do
    it 'returns a string' do
      @rover.status.should be_an_instance_of(String)
    end
    it 'message should be: [1, 2], N if rover = Rover.new(1, 2, "N")' do
      @rover.status.should == '[1, 2], N'
    end
    it 'rover2 message should be: [3, 3], E rover2 = Rover.new(3, 3, "E")' do
      @rover2.status.should == '[3, 3], E'
    end
  end

  describe '#move' do
    it 'increments @coords[1] by 1 if @deg == 90 with @coords = [1, 2]' do
      @rover.move()
      @rover.coords[1].should == 3
    end

    it 'decrements @coords[1] by 1 if @deg == 270 with @coords = [1, 2]' do
      2.times {@rover.turn('L')}
      @rover.move()
      @rover.coords[1].should == 1
    end

    it 'increments @coords[0] by 1 if @deg == 0 with @coords = [3, 3]' do
      @rover2.move()
      @rover2.coords[0].should == 4
    end

    it 'decrements @coords[0] by 1 if @deg == 180 with @coords = [3, 3]' do
      2.times {@rover2.turn('R')}
      @rover2.move()
      @rover2.coords[0].should == 2
    end
  end

  describe '#travel' do
    it 'given input: "LM", rover\'s new coords should be at [0, 2]' do
      @rover.travel('LM')
      @rover.coords.should == [0, 2]
    end
    it 'given input: "RRMMLMRM", rover\'s new coords should be at [2, -1]' do
      @rover.travel('RRMMLMRM')
      @rover.coords.should == [2, -1]
    end
    it 'given input: "MMMMRMMLMMM", rover\'s new coords should be at [3, 9]' do
      @rover.travel('MMMMRMMLMMM')
      @rover.coords.should == [3, 9]
    end
    it 'given input: "LMLMLMLMM", rover\'s new coords should be at [1, 3]' do
      @rover.travel('LMLMLMLMM')
      @rover.coords.should == [1, 3]
    end
    it 'given input: "MMRMMRMRRM", rover2\'s new coords should be at [5, 1]' do
      @rover2.travel('MMRMMRMRRM')
      @rover2.coords.should == [5, 1]
    end
  end
end














