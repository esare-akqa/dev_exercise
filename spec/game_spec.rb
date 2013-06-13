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

  describe '#contains_digits?' do
    it 'returns a True_class or False_class' do
      @game.contains_digits?(@test_input[0]).should be_an_instance_of(TrueClass)
      @game.contains_digits?(@test_input[2]).should be_an_instance_of(FalseClass)
    end
    it 'returns true if input is "5 5"' do
      @game.contains_digits?(@test_input[0]).should == true
    end
    it 'returns true if input is "1 2 N"' do
      @game.contains_digits?(@test_input[1]).should == true
    end
    it 'returns false if input is "LMLMLMLMM"' do
      @game.contains_digits?(@test_input[2]).should == false
    end
  end

  describe '#contains_letters?' do
    it 'returns a True_class or False_class' do
      @game.contains_letters?(@test_input[0]).should be_an_instance_of(FalseClass)
      @game.contains_letters?(@test_input[2]).should be_an_instance_of(TrueClass)
    end
    it 'returns false if input is "5 5"' do
      @game.contains_letters?(@test_input[0]).should == false
    end
    it 'returns true if input is "1 2 N"' do
      @game.contains_letters?(@test_input[1]).should == true
    end
    it 'returns true if input is "LMLMLMLMM"' do
      @game.contains_letters?(@test_input[2]).should == true
    end
  end

  describe '@test_input' do
    it 'should contain 5 elements' do
      @test_input.count.should == 5
    end
  end

  describe '#start' do
    before :each do
      @game.start
    end
    it 'should contains 2 rover objects' do
      @game.rovers.count.should == 2
    end
    it 'last rover should equal to 2nd rover' do
      @game.rovers.last.should equal @game.rovers[1]
    end
    it 'first rover should not equal to last rover' do
      @game.rovers.last.should_not equal @game.rovers[0]
    end
    it 'rover status should equal "[1, 2], N"' do
      @game.rovers.first.status.should == '[1, 3], N'
    end
    it 'rover status should not equal "[4, 8], E"' do
      @game.rovers.first.status.should_not == '[4, 8], E'
    end
    it 'rover2 status should equal "[5, 1], E"' do
      @game.rovers.last.status.should == '[5, 1], E'
    end
    it 'rover2 status should not equal "[-1, 4], W"' do
      @game.rovers.first.status.should_not == '[-1, 4], W'
    end
  end

  describe '#get_plateau_input' do
    it 'returns an instance of String' do
      @game.stub(:gets).and_return("20 5\n")
      @game.get_plateau_input.should be_an_instance_of String
    end
    it "raises RuntimeError if input is not valid" do
      # @game.stub(:gets).and_return("asd;lkfjasld;kfjalsd;fj")
      # @game.stub(:get_plateau_input).should raise_error(RuntimeError)
      # @game.get_plateau_input.should raise_error(RuntimeError)
      # expect { @game.get_plateau_input }.to raise_error(RuntimeError)
    end

    it "returns input if input is valid" do
      @game.stub(:gets).and_return("8798 35\n")
      @game.get_plateau_input.should == "8798 35"
      # @game.get_plateau_input.should == ""
    end
  end

  describe "#test_error" do
    it "raises RunTimeError" do
      expect { @game.test_error }.to raise_error(RuntimeError)
      # @game.stub!(:test_error).should raise_error(RuntimeError)
      # @game.test_error.and_raise(RuntimeError)
    end
  end



end
