require "minitest/autorun"
require "minitest/pride"
require './lib/board'

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

end


# pry(main)> require './lib/board'
# # => true
#
# pry(main)> board = Board.new
# # => #<Board:0x00007ff0728c8010...>
#
# pry(main)> board.cells
# # =>
# {
#  "A1" => #<Cell:0x00007ff0728a3f58...>,
#  "A2" => #<Cell:0x00007ff0728a3ee0...>,
#  "A3" => #<Cell:0x00007ff0728a3e68...>,
#  "A4" => #<Cell:0x00007ff0728a3df0...>,
#  "B1" => #<Cell:0x00007ff0728a3d78...>,
#  "B2" => #<Cell:0x00007ff0728a3d00...>,
#  "B3" => #<Cell:0x00007ff0728a3c88...>,
#  "B4" => #<Cell:0x00007ff0728a3c10...>,
#  "C1" => #<Cell:0x00007ff0728a3b98...>,
#  "C2" => #<Cell:0x00007ff0728a3b20...>,
#  "C3" => #<Cell:0x00007ff0728a3aa8...>,
#  "C4" => #<Cell:0x00007ff0728a3a30...>,
#  "D1" => #<Cell:0x00007ff0728a39b8...>,
#  "D2" => #<Cell:0x00007ff0728a3940...>,
#  "D3" => #<Cell:0x00007ff0728a38c8...>,
#  "D4" => #<Cell:0x00007ff0728a3850...>
# }