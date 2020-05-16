require "minitest/autorun"
require "minitest/pride"
require './lib/board'
require "./lib/ship"

class BoardTest < Minitest::Test
  def test_board_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_board_has_cells
    board = Board.new

    assert_instance_of Cell, board.cells["A1"]
    assert_equal 16, board.cells.count
    assert_equal "A1", board.cells["A1"].coordinate
  end

  def test_board_has_x_coordinates
    board = Board.new
    expecting = ["A","A","A","A","B","B","B","B","C","C","C","C","D","D","D","D"]
    assert_equal expecting,  board.x_coordinates
  end

  def test_board_has_y_coordinates
    board = Board.new
    expecting = [1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4]
    assert_equal expecting,  board.y_coordinates
  end

  def test_board_has_coordinates
    board = Board.new
    expecting = ['A1','A2','A3','A4','B1','B2','B3','B4','C1','C2','C3','C4','D1','D2','D3','D4']
    assert_equal expecting,  board.coordinates
  end

  def test_board_generate_cells
    board = Board.new

    assert_equal 16, board.generate_cells.count
    assert_instance_of Cell, board.generate_cells[0]
  end

  def test_board_has_valid_coodinates
    board = Board.new

    assert_equal true , board.valid_coordinate?("A1")
    assert_equal true , board.valid_coordinate?("D4")
    assert_equal false , board.valid_coordinate?("A5")
    assert_equal false , board.valid_coordinate?("E1")
    assert_equal false , board.valid_coordinate?("A22")
  end

  def test_board_has_valid_ship_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end

  def test_ship_cells_are_consecutive
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
    assert_equal true,  board.valid_placement?(submarine, ["A2", "A3"])
    # assert_equal false, board.valid_placement?(cruiser, ["A4", "B1", "B2"])
  end

  def test_ship_cells_are_not_diagnal
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
  end

  def test_ship_placement_is_valid
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, board.valid_placement?(cruiser, ["B1", "C1", "D1"])
  end
end
#
# pry(main)> board.valid_placement?(cruiser, ["A1", "B2", "C3"])
# # => false
#
# pry(main)> board.valid_placement?(submarine, ["C2", "D3"])
# # => false
