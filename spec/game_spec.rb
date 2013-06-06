require 'spec_helper'

describe Game do
  before :each do
    @game = Game.new()
    @inputs = %q{5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM\n}
    @test_input = Array.new
    @inputs.split('\n').each {|input| @test_input << input}
  end

  describe '#new' do
    it 'is an instance of Game object' do
      @game.should be_an_instance_of(Game)
    end
  end

  describe '#rover' do
    it 'is an instance of Array' do
      @game.rovers.should be_an_instance_of(Array)
    end
    it 'is an empty Array' do
      @game.rovers.should be_empty
    end
  end

  describe '#inputs' do
    it 'is an instance of String' do
      @game.inputs.should be_an_instance_of(String)
    end
  end

  describe '#contains_digits' do
    it 'returns a True_class or False_class' do
      @game.contains_digits(@test_input[0]).should be_an_instance_of(TrueClass)
      @game.contains_digits(@test_input[2]).should be_an_instance_of(FalseClass)
    end
    it 'returns true if input is "5 5"' do
      @game.contains_digits(@test_input[0]).should == true
    end
    it 'returns true if input is "1 2 N"' do
      @game.contains_digits(@test_input[1]).should == true
    end
    it 'returns false if input is "LMLMLMLMM"' do
      @game.contains_digits(@test_input[2]).should == false
    end
  end

  describe '#contains_letters' do
    it 'returns a True_class or False_class' do
      @game.contains_letters(@test_input[0]).should be_an_instance_of(FalseClass)
      @game.contains_letters(@test_input[2]).should be_an_instance_of(TrueClass)
    end
    it 'returns false if input is "5 5"' do
      @game.contains_letters(@test_input[0]).should == false
    end
    it 'returns true if input is "1 2 N"' do
      @game.contains_letters(@test_input[1]).should == true
    end
    it 'returns true if input is "LMLMLMLMM"' do
      @game.contains_letters(@test_input[2]).should == true
    end
  end

  describe '@test_input' do
    it 'should contain 5 elements' do
      @test_input.count.should == 5
    end
  end

  describe '#start' do
    it 'should contains 2 rover objects' do
      @game.start()
      @game.rovers.count.should == 2
    end
  end



end
