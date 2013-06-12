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

  describe '#get_input' do
    # it "length of input array should equal to 0"
    # @game.input.length.should == 0
  end

  # describe '#valid_plateau_input?' do
  #   before :each do
  #     @plateau_input = "13 20 \n"
  #     @plateau_input2 = "4 6 \n"
  #     @plateau_input3 = "8 6"
  #     @plateau_input4 = "828347629387498237498023 76123745263452683546253842    "
  #     @plateau_input5 = "72678236482364 23462387469872698476298364978236987469"
  #   end
  #   it 'returns a True_class or False_class' do
  #     @game.valid_plateau_input?(@plateau_input).should be_an_instance_of(FalseClass)
  #     @game.valid_plateau_input?(@plateau_input3).should be_an_instance_of(TrueClass)
  #   end
  #   it 'returns false if @plateau_input = "13 20 \n"' do
  #     @game.valid_plateau_input?(@plateau_input).should == false
  #   end
  #   it 'returns false if @plateau_input2 = "4 6 \n"' do
  #     @game.valid_plateau_input?(@plateau_input2).should == false
  #   end
  #   it "returns true if @plateau_input3 = '8 6'" do
  #     @game.valid_plateau_input?(@plateau_input3).should == true
  #   end
  #   it "returns false if @plateau_input4 has trailing white spaces with value = '828347629387498237498023 76123745263452683546253842     '" do
  #     @game.valid_plateau_input?(@plateau_input4).should == false
  #   end
  #   it "returns true if @plateau_input5 = '72678236482364 23462387469872698476298364978236987469'" do
  #     @game.valid_plateau_input?(@plateau_input5).should == true
  #   end
  # end

  describe '#valid_rover_input?' do
    before :each do
      @rover_input = "1 2 S"
      @rover_input2 = "10      948 E"
      @rover_input3 = "82 37 X"
      @rover_input4 = "83838 446 SW"
      @rover_input5 = "83448 223 E                      "
      @rover_input6 = "74298472089 2384738 S"
    end
    it 'returns a True_class or False_class' do
      @game.contains_letters?(@test_input[0]).should be_an_instance_of(FalseClass)
      @game.contains_letters?(@test_input[2]).should be_an_instance_of(TrueClass)
    end
    it "returns true if @rover_input = '1 2 S'" do
      @game.valid_rover_input?(@rover_input).should == true
    end
    it "returns false if @rover_input2 = '10      948 E'" do
      @game.valid_rover_input?(@rover_input2).should == false
    end
    it "returns false if @rover_input3 = '82 37 X'" do
      @game.valid_rover_input?(@rover_input3).should == false
    end
    it "returns false if @rover_input4 = '83838 446 SW'" do
      @game.valid_rover_input?(@rover_input4).should == false
    end
    it "returns false if @rover_input5 has trailing spaces with value = '83448 223 E                      ' " do
      @game.valid_rover_input?(@rover_input5).should == false
    end
    it "returns true if @rover_input6 = '74298472089 2384738 S'" do
      @game.valid_rover_input?(@rover_input6).should == true
    end
  end


end
