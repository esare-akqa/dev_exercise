class Game
  attr_accessor :plateau, :rovers, :input

  def initialize()
    @rovers = Array.new
    @input = %q{5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM\n}
  end
end