
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

  def test_computer_can_generate_random_placement
    board = Board.new
    cruiser = Ship.new("cruiser", 3);
    computer = Player.new(board)
    actual =  computer.board.all_possible_coordinates_to_be_placed(cruiser.length).include?(computer.gen_ship(cruiser))
    assert_equal true, actual
  end

  def test_computer_can_generate_shots
    board = Board.new
    computer = Player.new(board)

    assert_equal true, computer.board.coordinates.include?(computer.gen_shot(board))
  end

end
