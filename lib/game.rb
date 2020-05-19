require "./lib/ship"
require "./lib/board"
require "./lib/player"

class Game
  def start
    player_board = Board.new
    computer_board = Board.new
  end
end
