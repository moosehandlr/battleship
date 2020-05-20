
class Ship
  attr_reader :name, :length, :health
  def initialize(name, cell_length)
    @name = name
    @length = cell_length
    @health = cell_length
  end

  def sunk?
    @health <= 0
  end

  def hit
    @health -= 1
  end
end
