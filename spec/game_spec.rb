require 'spec_helper'

describe Game do
  before :each do
    @game = Game.new()
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
  end

end