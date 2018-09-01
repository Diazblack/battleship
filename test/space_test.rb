require './test/minitest_helper'

require './lib/space'

class SpaceTest < Minitest::Test
  def test_if_exist
    a1 = Space.new

    assert_instance_of Space, a1
  end

  def test_if_it_can_hold_a_ship
      a1 = Space.new(ship)

      assert_equal

end
