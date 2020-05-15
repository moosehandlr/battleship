require "./lib/cell"

class Board
  def cells
    # letter_arr = ("A".."D").to_a.map{|letter| letter*4}.join.split("")
    # number_arr = (1..4).to_a*4
    # mix = self.x_coordinates.zip(self.y_coordinates)
    # board_coordinates = mix.map{|arr| arr.join}
    cell_values = self.coordinates.map{|coord| Cell.new(coord)}
    # zipp values
    zipped = self.coordinates.zip(cell_values)

    Hash[zipped]
  end

  def x_coordinates
    ("A".."D").to_a.map{|letter| letter*4}.join.split("")
  end

  def y_coordinates
    (1..4).to_a*4
  end

  def coordinates
    self.x_coordinates.zip(self.y_coordinates).map{|coord| coord.join}
  end

  def valid_coordinate?(coordinate)
    self.cells.keys.include?(coordinate)
  end
end
