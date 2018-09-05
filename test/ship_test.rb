require './test/minitest_helper'

require './lib/ship'

class ShipTest < Minitest::Test
  def test_if_exist
    ship = Ship.new(2)

    assert_instance_of Ship , ship
  end

  def test_if_it_can_get_coordenades
    ship = Ship.new(2)

    ship.get_coordenades([[0, 1], [1, 1]])

    assert_equal [[0, 1], [1, 1]], ship.coordenades
  end

  def test_if_ship_can_be_hit
    ship = Ship.new(2)

    ship.hit

    assert_equal true, ship.hit?
  end

  def test_if_ship_can_be_sink
    ship = Ship.new(2)

    ship.hit
    ship.hit

    assert_equal true, ship.sink?
  end
end
