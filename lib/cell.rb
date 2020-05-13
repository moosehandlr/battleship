class Cell

  attr_reader

  def initialize(cell_position)
    @position = cell_position
    @fired_upon = false
  end

  def coordinate
    @position
  end

  def ship
    @ship
  end

  def empty?
    if ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship_type)
    if self.ship == nil
      @ship = ship_type
    end
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    self.ship.hit
    @fired_upon = true
  end

end
