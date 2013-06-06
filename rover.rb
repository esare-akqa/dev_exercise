class Rover
  attr_accessor :coords, :deg

  def initialize(x, y, dir)
    @coords = Array.new(2)
    @heading = {'N' =>  90, 'E' =>  0, 'S' =>  270, 'W' =>  180}
    @turn_dir = {'L' => 90, 'R' => -90}
    @coords[0], @coords[1], @deg = x, y, set_deg(dir)
  end

  def set_deg(letter)
    @deg = @heading[letter] if @heading.has_key? letter
  end

  def turn(dir)
    @deg = (@deg + @turn_dir[dir]) % 360 if @turn_dir.has_key? dir
  end

end