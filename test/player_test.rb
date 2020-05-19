
require "minitest/autorun"
require "minitest/pride"
require "./lib/player"
require "./lib/board"
require "./lib/ship"

class PlayerTest < Minitest::Test

  def test_player_types
    cruiser= Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    ships = [cruiser, submarine]

    board1 = Board.new
    board2 = Board.new

    player1 = Player.new("human", board1, ships)
    player2 = Player.new("computer", board2, ships)

    assert_equal "human", player1.player_type
    assert_equal "computer", player2.player_type
  end

  def test_players_has_two_ships
    cruiser= Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    ships = [cruiser, submarine]

    board1 = Board.new
    board2 = Board.new

    player1 = Player.new("human", board1, ships)
    player2 = Player.new("computer", board2, ships)

    assert_equal [cruiser, submarine], player1.ships
  end

  def test_players_have_an_empty_board
    cruiser= Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    ships = [cruiser, submarine]

    board1 = Board.new
    board2 = Board.new

    player1 = Player.new("human", board1, ships)
    player2 = Player.new("computer", board2, ships)

    assert_equal board1, player1.board
    assert_equal board2, player2.board
  end

  def test_if_player_has_lost
    cruiser= Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    ships = [cruiser, submarine]

    board1 = Board.new
    board2 = Board.new

    player1 = Player.new("human", board1, ships)
    player2 = Player.new("computer", board2, ships)

    assert_equal true, player1.has_lost?

  end
end
