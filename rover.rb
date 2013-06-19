class Rover
  attr_accessor :coords, :deg
  attr_reader :heading, :turn_dir

  def initialize(x, y, dir)
    @coords = []
    @heading = {:N =>  90, :E =>  0, :S =>  270, :W =>  180}
    @turn_dir = {:L => 90, :R => -90}
    @coords[0], @coords[1] = x, y
    @deg = set_deg(dir.to_sym)
  end

  def self.valid_rover_input?(str)
    !(str =~ /^[[:digit:]]+\ [[:digit:]]+\ [NESW]$/).nil?
  end

  def self.valid_travel_input?(str)
    !(str =~ /^[LRM]+$/).nil?
  end

  def get_heading
    @heading.key(@deg).to_s if @heading.has_value? (@deg)
  end

  def move
    if @deg == 90 #north
      @coords[1] += 1
    elsif @deg == 0 #east
      @coords[0] += 1
    elsif @deg == 270 #south
      @coords[1] -= 1
    else #west
      @coords[0] -= 1
    end
  end

  def set_deg(letter)
    @deg = @heading[letter] if @heading.has_key? letter
  end

  def travel(inputs)
    inputs.split('').each do |input|
      input = input.to_sym
      if @turn_dir.has_key? input
        turn(input)
      elsif input == :M
        move
      end
    end
  end

  def turn(dir)
    dir = dir.to_sym
    @deg = (@deg + @turn_dir[dir]) % 360 if @turn_dir.has_key? dir
  end

  def status
    "[#{ coords[0] }, #{ coords[1] }], #{ get_heading }"
  end
end