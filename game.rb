class Game
  attr_accessor :plateau, :rovers, :inputs, :current_rover

  def initialize()
    @rovers = Array.new
    @plateau = nil
    @current_rover = nil
    @inputs = %q{5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM\n}
  end

  def start
    @inputs.split('\n').each do |input|
      if contains_digits?(input) && contains_letters?(input)
        result = input.split(' ')
        x = result[0].to_i
        y = result[1].to_i
        heading = result[2]
        @rovers << Rover.new(x, y, heading)
        @current_rover = @rovers.last
      elsif contains_digits?(input)
        width, length = input.split(' ')
        @plateau ||= Plateau.new(width, length)
      elsif contains_letters?(input)
        @current_rover.travel(input)
      end
    end
  end

  def contains_digits?(str)
    result = str =~ /\d/
    result = !result.nil? ? true : false
  end

  def contains_letters?(str)
    result = str =~ /[[:alpha:]]/
    result = !result.nil? ? true : false
  end

end