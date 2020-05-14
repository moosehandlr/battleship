class Cell

  attr_reader :coordinate, :ship

  def initialize(cell_position)
    @coordinate = cell_position
    @fired_upon = false
    @render = "."
  end

  def empty?
    self.ship.nil?
  end

  def place_ship(ship_type)
    if self.ship.nil?
      @ship = ship_type
    end
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if !self.ship.nil?
      self.ship.hit
    end
    @fired_upon = true
    return @render = "H" if @render == "S"
    @render = "M"
  end

  def render(bool = false)
    if bool
       @render = "S"
    end
    if !self.empty? && self.ship.sunk?
      @render = "X"
    end
    @render
  end
end
