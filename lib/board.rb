require "./lib/cell"

class Board
  attr_reader  :cells
  def initialize
    @cells = self.coord_with_cells
  end
  def coord_with_cells
    Hash[self.coordinates.zip(self.generate_cells)]
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

  def generate_cells
    self.coordinates.map{|coord| Cell.new(coord)}
  end

  def valid_coordinate?(coordinate)
    self.coord_with_cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, board_cells)
    board_cells.size == ship.length
    self.coordinates.each_cons(ship.length).map{|coord| coord}.include?(board_cells)
  end

  def consecutive_vertical_valid_placement(ship_length)
    sorted_coords = self.coordinates.sort do |coord_small, coord_large|
      coord_small.split("")[1].to_i <=> coord_large.split("")[1].to_i
    end
    sorted_coords.each_cons(ship_length).map{|p| p}
  end

  def place(ship, cells)
  cells.each do |cell|
    @cells[cell].place_ship(ship)
  end
end
end
