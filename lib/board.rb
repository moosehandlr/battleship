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
    if !board_cells.find{|el| self.coordinates_with_ship.include?(el)}.nil?
      return false
    end
    self.consecutive_horizontal_valid_placement(ship.length).include?(board_cells)||
    self.consecutive_vertical_valid_placement(ship.length).include?(board_cells)
  end

  def consecutive_horizontal_valid_placement(ship_length)
    sorted_coords = self.coordinates.each_cons(ship_length).map{|coord| coord}.select do |coords|
      coords[0][0] == (coords[-1][0])
    end
    reverse_coords = sorted_coords.map{|coord| coord.reverse}
    sorted_coords.concat(reverse_coords)
  end

  def consecutive_vertical_valid_placement(ship_length)
    sorted_coords = (("A".."D").to_a*4).zip(self.coordinates.map{|coord| coord[1]}.sort)
    sorted_coords = sorted_coords.map{|c| c.join}
    sorted_coords = sorted_coords.each_cons(ship_length).select do |coords|
      coords[0][1] == (coords[-1][1])
    end
    reverse = sorted_coords.map{|coord| coord.reverse}
    sorted_coords.concat(reverse)
  end

  def all_possible_coordinates_to_be_placed(ship_length)
    consecutive_horizontal_valid_placement(ship_length).concat(consecutive_vertical_valid_placement(ship_length))
  end

  def coordinates_with_ship
    self.cells.values.select{|cell| !cell.ship.nil? }.map{|coord| coord.coordinate}
  end

  def place(ship, cells)
    cells.each do |cell|
      @cells[cell].place_ship(ship)
    end
  end

  def render(show = false)
    "  1 2 3 4 \n"+
    "A #{@cells["A1"].render(show)} #{@cells["A2"].render(show)} #{@cells["A3"].render(show)} #{@cells["A4"].render(show)} \n"+
    "B #{@cells["B1"].render(show)} #{@cells["B2"].render(show)} #{@cells["B3"].render(show)} #{@cells["B4"].render(show)} \n"+
    "C #{@cells["C1"].render(show)} #{@cells["C2"].render(show)} #{@cells["C3"].render(show)} #{@cells["C4"].render(show)} \n"+
    "D #{@cells["D1"].render(show)} #{@cells["D2"].render(show)} #{@cells["D3"].render(show)} #{@cells["D4"].render(show)} \n"
  end

end
