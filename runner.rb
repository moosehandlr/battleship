require "./lib/game"
space = "\n"

puts "Welcome to BATTLESHIP: Terminator edition!"
puts space
sleep(1)
puts "Terminator ships are now in position..."
puts "You now need to lay out your two ships."
puts "The Cruiser is three units long and the Submarine is two units long."


loop do
  puts "Enter s to start or q to quit"
  start_game_input = gets.chomp.upcase
  case start_game_input
  when  "S"
    game = Game.new
    game.start
  when "Q"
    puts "The humans have lost and terminators have taken over the world"
    break
  else
    puts "Please enter a valid input 's or q'"
  end
end
