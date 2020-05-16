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
    if self.empty?
      @ship = ship_type
    end
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if !self.empty?
      self.ship.hit
    end
    @fired_upon = true
  end

  def render(show = false)
    if show && !self.empty?
       @render = "S"
    end
    if self.fired_upon? && self.empty?
      @render = "M"
    end
    if self.fired_upon? && !self.empty?
      @render = "H"
    end
    if !self.empty? && self.ship.sunk?
      @render = "X"
    end
    @render
  end
end
