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
      @plateau.width.should_not be_nil
      @plateau2.width.should_not be_nil
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
      @plateau.length.should_not be_nil
      @plateau2.length.should_not be_nil
    end
  end

  describe 'Plateau#valid_plateau_input?' do
    before :each do
      @plateau_input = "13 20 \n"
      @plateau_input2 = "4 6 \n"
      @plateau_input3 = "8 6"
      @plateau_input4 = "828347629387498237498023 76123745263452683546253842    "
      @plateau_input5 = "72678236482364 23462387469872698476298364978236987469"
    end
    it 'returns a True_class or False_class' do
      Plateau.valid_plateau_input?(@plateau_input).should be_an_instance_of(FalseClass)
      Plateau.valid_plateau_input?(@plateau_input3).should be_an_instance_of(TrueClass)
    end
    it 'returns false if @plateau_input = "13 20 \n"' do
      Plateau.valid_plateau_input?(@plateau_input).should == false
    end
    it 'returns false if @plateau_input2 = "4 6 \n"' do
      Plateau.valid_plateau_input?(@plateau_input2).should == false
    end
    it "returns true if @plateau_input3 = '8 6'" do
      Plateau.valid_plateau_input?(@plateau_input3).should == true
    end
    it "returns false if @plateau_input4 has trailing white spaces with value = '828347629387498237498023 76123745263452683546253842     '" do
      Plateau.valid_plateau_input?(@plateau_input4).should == false
    end
    it "returns true if @plateau_input5 = '72678236482364 23462387469872698476298364978236987469'" do
      Plateau.valid_plateau_input?(@plateau_input5).should == true
    end
  end
end
