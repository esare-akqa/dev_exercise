class Rover
  attr_accessor :coords, :deg

  def initialize(input)
    @coords = Array.new(2)
    @heading = {'N' =>  90, 'E' =>  0, 'S' =>  270, 'W' =>  180}
    input = input.split(' ')
    coords[0], coords[1], @deg = input[0].to_i, input[1].to_i, set_deg(input[2])
  end

  def set_deg(input)
    @deg = @heading[input] if @heading.has_key? input
  end
end