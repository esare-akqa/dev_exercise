class Plateau
  attr_reader :width, :length
  def initialize(width = 10, length = 10)
    @width = width
    @length = length
  end

  def self.valid_plateau_input?(str)
    result = str =~ /^[[:digit:]]+\ [[:digit:]]+$/
    result = !result.nil? ? true: false
  end
end