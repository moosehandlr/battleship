require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def test_it_exists
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end


  def test_cell_coordinate
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
  end


  def test_if_cell_has_a_ship
    cell = Cell.new("B4")

    assert_nil nil, cell.ship
  end


  def test_if_cell_is_empty
    cell = Cell.new("B4")

    assert_equal true, cell.empty?
  end


  def test_for_ship_placement
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")

    cell.place_ship(cruiser)

    assert_instance_of Ship, cell.ship
  end

  def test_if_cell_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    assert_equal false, cell.fired_upon?
    cell.fire_upon
    assert_equal true, cell.fired_upon?
  end

  def test_if_cell_fired_upon_affect_health
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    assert_equal false, cell.fired_upon?
    cell.fire_upon
    assert_equal true, cell.fired_upon?
    assert_equal 2, cell.ship.health
  end

  def test_it_can_render_dot
    cell_1 = Cell.new("B4")
    #require "pry"; binding.pry
    assert_equal ".", cell_1.render
  end

  def test_it_can_render_M_when_fired_upon
    # skip
    cell_1 = Cell.new("B4")

    assert_equal ".", cell_1.render
    cell_1.fire_upon
    assert_equal "M", cell_1.render
  end

  def test_it_can_render_dot_when_not_fired_upon
    # skip
    cell_1 = Cell.new("B4")

    assert_equal ".", cell_1.render
    cell_1.fire_upon
    assert_equal "M", cell_1.render

    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    assert_equal ".", cell_2.render
  end

  def test_if_cell_can_render_ship_location
    # skip
    cell_1 = Cell.new("B4")

    assert_equal ".", cell_1.render
    cell_1.fire_upon
    assert_equal "M", cell_1.render

    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    assert_equal ".", cell_2.render
    assert_equal "S", cell_2.render(true)
  end

  def test_it_renders_H_when_hit
    # skip
    cell_1 = Cell.new("B4")

    assert_equal ".", cell_1.render
    cell_1.fire_upon
    assert_equal "M", cell_1.render

    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    assert_equal ".", cell_2.render
    assert_equal "S", cell_2.render(true)

    cell_2.fire_upon
    assert_equal "H", cell_2.render
  end

  def test_if_cruiser_ship_has_sunk
    # skip
    cell_1 = Cell.new("B4")

    assert_equal ".", cell_1.render
    cell_1.fire_upon
    assert_equal "M", cell_1.render

    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    assert_equal ".", cell_2.render
    assert_equal "S", cell_2.render(true)

    cell_2.fire_upon
    assert_equal "H", cell_2.render
    assert_equal false, cruiser.sunk?
  end

  def test_if_cruiser_ship_has_sunk_after_3_hits
    # skip
    cell_1 = Cell.new("B4")

    assert_equal ".", cell_1.render
    cell_1.fire_upon
    assert_equal "M", cell_1.render

    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    assert_equal ".", cell_2.render
    assert_equal "S", cell_2.render(true)

    cell_2.fire_upon
    assert_equal "H", cell_2.render
    assert_equal false, cruiser.sunk?
    cruiser.hit
    cruiser.hit
    assert_equal true, cruiser.sunk?
  end

  def test_it_renders_X_when_ship_is_sunk
    # skip
    cell_1 = Cell.new("B4")

    assert_equal ".", cell_1.render
    cell_1.fire_upon
    assert_equal "M", cell_1.render

    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    assert_equal ".", cell_2.render
    assert_equal "S", cell_2.render(true)

    cell_2.fire_upon
    assert_equal "H", cell_2.render
    assert_equal false, cruiser.sunk?
    cruiser.hit
    cruiser.hit
    assert_equal true, cruiser.sunk?
    assert_equal "X", cell_2.render
  end
end
