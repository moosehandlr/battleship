require "./lib/game"
space = "\n"

puts "Welcome to BATTLESHIP"
puts space
sleep(1)
puts "Enter 'p' to start or 'q 'to quit"
puts space
sleep(0.5)
puts "I have laid out my ships on the grid."
puts "You now need to lay out your two ships."
puts "The Cruiser is three units long and the Submarine is two units long."


loop do
  start_game_input = gets.chomp.upcase
  case start_game_input
  when  "P"
    game = Game.new
    game.start
  when "Q"
    puts "You quitted and let the terminators take over the world"
    break
  else
    puts "Please enter a valid input 'p or q'"
  end
end
