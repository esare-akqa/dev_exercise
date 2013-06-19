class Game
  attr_reader :plateau, :rovers, :inputs, :current_rover, :prompts

  def initialize
    @rovers = []
    @inputs = {}
    @plateau = nil
    @current_rover = nil
    @prompts = {'plateau_prompt' => "Please enter plateau coordinates with 2 digits separated by a space. Ex: '5 17'",
                'rover_input_prompt' => "Please enter Rover coordinates & heading with 2 positive integers and either N|E|S|W for heading each separated by a space. Ex: '89 12 E'",
                'rover_travel_prompt' => "Please enter Rover travel inputs with L/R for left/right turn and M to move one coordinate. Ex: 'LMRRMMLM'"}
    # @inputs = %q{5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM\n}
  end

  def start
    @inputs['plateau_input'] == get_plateau_input
    @inputs['rover1_input'] == get_rover_input
    @inputs['rover1_travel_input'] == get_rover_travel_input
    @inputs['rover2_input'] == get_rover_input
    @inputs['rover2_travel_input'] == get_rover_travel_input

    @inputs.each do |input|
      if contains_digits?(input) && contains_letters?(input)
        result = input.split(' ')
        x = result[0].to_i
        y = result[1].to_i
        heading = result[2]
        @rovers << Rover.new(x, y, heading, @plateau)
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
    !(str =~ /[[:digit:]]/).nil?
  end

  def contains_letters?(str)
    !(str =~ /[[:alpha:]]/).nil?
  end

  def get_plateau_input
    prompt = "Please enter plateau coordinates with 2 digits separated by a space. Ex: '5 17'"
    begin
      puts prompt
      input = gets.chomp.strip
      raise 'Input does not match requirements' if !Plateau.valid_plateau_input?(input)
    rescue RuntimeError => e
      puts "#{ e }"
      retry
    else
      input
    end
  end

  def get_rover_input
    prompt = "Please enter Rover coordinates & heading with 2 positive integers and either N|E|S|W for heading each separated by a space. Ex: '89 12 E'"
    begin
      puts prompt
      input = gets.chomp.strip
      raise 'Input does not match requirements' if !Rover.valid_rover_input?(input)
    rescue RuntimeError => e
      puts "#{ e }"
      retry
    else
      input
    end
  end

  def get_rover_travel_input
    prompt = "Please enter Rover travel inputs with L/R for left/right turn and M to move one coordinate. Ex: 'LMRRMMLM'"
    begin
      puts prompt
      input = gets.chomp.strip
      raise 'Input does not match requirements' if !Rover.valid_travel_input?(input)
    rescue RuntimeError => e
      puts "#{ e }"
      retry
    else
      input
    end
  end

  def test_error
    raise RuntimeError
  end
end