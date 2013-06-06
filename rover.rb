class Rover
  attr_accessor :coord, :deg

  def initialize(input)
    @coord = Array.new(2)
    @heading = {'N' =>  90, 'E' =>  0, 'S' =>  270, 'W' =>  180}
    input = input.split(' ')
    coord[0], coord[1], @deg = input[0], input[1], set_deg(input[2])
  end

  def set_deg(input)
    @deg = @heading[input] if @heading.has_key? input
  end
end