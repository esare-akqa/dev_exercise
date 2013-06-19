require 'spec_helper'

describe Game do
  before :each do
    @game = Game.new
    @inputs = %q{5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM\n}
    @test_input = []
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
    it 'is an instance of Array' do
      @game.inputs.should be_an_instance_of(Hash)
    end
    it 'starts with a length of 0 items' do
      @game.inputs.count.should == 0
    end
  end

  describe '#prompts' do
    it 'is an instance of Hash' do
      @game.prompts.should be_an_instance_of(Hash)
    end
    it 'has 3 items' do
      @game.prompts.count.should == 3
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
      @plateau_input = "5 5 \n"
      @rover1_input = "1 2 N\n"
      @rover1_move_input = "LMLMLMLMM\n"
      @rover2_input = "3 3 E\n"
      @rover2_move_input = "MMRMMRMRRM\n"
      @game.stub(:gets).and_return(@plateau_input,
                                   @rover1_input,
                                   @rover1_move_input,
                                   @rover2_input,
                                   @rover2_move_input)
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
    it 'first rover status should equal "[1, 3], N"' do
      @game.rovers.first.status.should == '[1, 3], N'
    end
    it 'first rover status should not equal "[4, 8], E"' do
      @game.rovers.first.status.should_not == '[4, 8], E'
    end
    it 'second rover status should equal "[5, 1], E"' do
      @game.rovers.last.status.should == '[5, 1], E'
    end
    it 'second rover status should not equal "[-1, 4], W"' do
      @game.rovers.first.status.should_not == '[-1, 4], W'
    end
  end

  describe '#get_plateau_input' do
    it 'returns an instance of String' do
      @game.stub(:gets).and_return("20 5\n")
      @game.get_plateau_input.should be_an_instance_of String
    end
    it "raises RuntimeError if input is not valid" do
      # TODO: find out how to test for raising exception inside a method
      # @game.stub(:gets).and_return("asd;lkfjasld;kfjalsd;fj")
      # expect { @game.get_plateau_input }.to raise_error(RuntimeError)
      # @game.stub(:gets).and_return("8798 35")
      # @game.get_plateau_input.should == "8798 35"
      # @game.stub(:get_plateau_input).should raise_error(RuntimeError)
      # @game.get_plateau_input.should raise_error(RuntimeError)
      # expect { @game.get_plateau_input }.to raise_error(RuntimeError)
    end

    it "returns input if input is valid" do
      @game.stub(:gets).and_return("8798 35\n")
      @game.get_plateau_input.should == "8798 35"
    end
  end

  describe '#get_rover_input' do
    before :each do
      @rover_input = "28 50 W"
      @rover_input2 = "78 49 E"
    end

    it 'returns an instance of String' do
      @game.stub(:gets).and_return("28 50 W\n")
      @game.get_rover_input.should be_an_instance_of String
    end
    it 'returns input if input is valid' do
      @game.stub(:gets).and_return("78 49 E\n")
      @game.get_rover_input.should == @rover_input2
    end
  end

  describe '#get_rover_travel_input' do
    before :each do
      @rover_travel_input = "MMMRMLRRRM\n"
      @rover_travel_input2 = "RRMLMRM"
    end

    it 'returns an instance of String' do
      @game.stub(:gets).and_return("MMMRMLRRRM\n")
      @game.get_rover_travel_input.should be_an_instance_of String
    end
    it 'returns input if input is valid' do
      @game.stub(:gets).and_return("RRMLMRM\n")
      @game.get_rover_travel_input.should == @rover_travel_input2
    end
  end

  describe '#prompt_user_input' do
    before :each do
      @prompt = "user prompt"
    end
    it 'should return input string minus newline' do
      @game.stub(:gets).and_return("MMRMLLLMR\n")
      @game.prompt_user_input(@prompt).should == "MMRMLLLMR"
    end
    it 'not return a different string from the original input' do
      @game.stub(:gets).and_return("5 5 N\n")
      @game.prompt_user_input(@prompt).should_not == "9 0 E"
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
