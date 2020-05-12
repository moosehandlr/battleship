
require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"

class ShipTest < Minitest::Test
  def test_it_exist
    cruiser = Ship.new("Cruiser", 3)

    assert_instance_of Ship, cruiser
  end

  def test_it_has_name_and_length
    cruiser = Ship.new("Cruiser", 3)

    assert_equal "Cruiser", cruiser.name
    assert_equal 3  , cruiser.length
  end

  def test_it_has_health
    skip
    cruiser = Ship.new("Cruiser", 3)

    assert_equal 3  , cruiser.health
  end
end


# pry(main)> cruiser = Ship.new("Cruiser", 3)
# #=> #<Ship:0x00007feb05112d10...>
#
# pry(main)> cruiser.name
# #=> "Cruiser"
#
# pry(main)> cruiser.length
# #=> 3
#
# pry(main)> cruiser.health
# #=> 3
#
# pry(main)> cruiser.sunk?
# #=> false
#
# pry(main)> cruiser.hit
#
# pry(main)> cruiser.health
# #=> 2
#
# pry(main)> cruiser.hit
#
# pry(main)> cruiser.health
# #=> 1
#
# pry(main)> cruiser.sunk?
# #=> false
#
# pry(main)> cruiser.hit
#
# pry(main)> cruiser.sunk?
# #=> true
