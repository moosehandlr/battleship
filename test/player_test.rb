
require "minitest/autorun"
require "minitest/pride"
require "./lib/player"
require "./lib/board"

class PlayerTest < Minitest::Test

  def test_player_types
    skip
    player1 = Player.new("human")
    player2 = Player.new("computer")

    assert_equal "human", player1.player_type
    assert_equal "computer", player2.player_type
  end

  def test_players_have_an_empty_board
    board1 = Board.new
    board2 = Board.new

    player1 = Player.new("human", board1)
    player2 = Player.new("computer", board2)

    # require "pry"; binding.pry

    assert_equal board1, player1.board
  end
end
