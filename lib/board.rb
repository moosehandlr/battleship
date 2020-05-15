require "./lib/cell"

class Board
  def cells
    # letter_arr = ("A".."D").to_a.map{|letter| letter*4}.join.split("")
    number_arr = (1..4).to_a*4
    mix = self.x_coordinates.zip(number_arr)
    board_coordinates = mix.map{|arr| arr.join}
    cell_values = board_coordinates.map{|coord| Cell.new(coord)}
    # zipp values
    zipped = board_coordinates.zip(cell_values)

    Hash[zipped]
  end

  def x_coordinates
    ("A".."D").to_a.map{|letter| letter*4}.join.split("")
  end

  def valid_coordinate?(coordinate)
    self.cells.keys.include?(coordinate)
  end
end
