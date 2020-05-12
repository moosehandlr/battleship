
class Ship
  attr_reader :name, :length
  def initialize(name, cell_length)
    @name = name
    @length = cell_length
  end

  def health
    @length
  end

  def sunk?
    false
  end
end
