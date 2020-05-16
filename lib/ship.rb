
class Ship
  attr_reader :name, :length
  def initialize(name, cell_length)
    @name = name
    @length = cell_length
    @health = @length
  end

  def health
    @health
  end

  def sunk?
    @health.zero?
  end

  def hit
    @health -= 1
  end
end
