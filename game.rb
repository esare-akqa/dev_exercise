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
    get_plateau_input
    get_rover_input
    get_rover_travel_input
    get_rover_input
    get_rover_travel_input
  end

  def contains_digits?(str)
    !(str =~ /[[:digit:]]/).nil?
  end

  def contains_letters?(str)
    !(str =~ /[[:alpha:]]/).nil?
  end

  def get_plateau_input
    input = prompt_user_input(@prompts['plateau_prompt'])

    while !Plateau.valid_plateau_input?(input)
      puts 'Input does not match requirements!'
      input = prompt_user_input(@prompts['plateau_prompt'])
    end

    input = input.split(' ')
    width, length = input[0].to_i, input[1].to_i
    @plateau ||= Plateau.new(width, length)
    @plateau
  end

  def get_rover_input
    input = prompt_user_input(@prompts['rover_input_prompt'])

    while !Rover.valid_rover_input?(input)
      puts 'Input does not match requirements!'
      input = prompt_user_input(@prompts['rover_input_prompt'])
    end

    input = input.split(' ')
    x = input[0].to_i
    y = input[1].to_i
    heading = input[2]
    @rovers << Rover.new(x, y, heading, @plateau)
    @current_rover = @rovers.last
  end

  def get_rover_travel_input
    input = prompt_user_input(@prompts['rover_travel_prompt'])

    while !Rover.valid_travel_input?(input)
      puts 'Input does not match requirements!'
      input = prompt_user_input(@prompts['rover_travel_prompt'])
    end

    @current_rover.travel(input)
  end

  def prompt_user_input(prompt)
    puts prompt
    input = gets.chomp.strip
    input
  end

  def test_error
    raise RuntimeError
  end
end