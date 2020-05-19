
require "minitest/autorun"
require "minitest/pride"
require "./lib/player"
require "./lib/board"
require "./lib/ship"

class PlayerTest < Minitest::Test

  def test_it_exist
    board = Board.new
    player = Player.new(board)

    assert_instance_of Player, player
  end

end
