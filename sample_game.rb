require_relative 'game'
require_relative 'plateau'
require_relative 'rover'

game = Game.new()
game.start

game.rovers.each_with_index do |rover, index|
  puts "rover#{index} location: #{rover.status}"
end

puts "Game finished, please go do a Martian victory dance!!"


