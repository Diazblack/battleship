require './test/minitest_helper'

require './lib/board'
require './lib/ship'

class BoardTest < Minitest::Test

  def test_if_exist
    board = Board.new

    assert_instance_of Board,  board
  end

  def test_if_it_can_hold_a_diccionary
    board = Board.new

    expected = {"a" => 0,"b" => 1, "c" => 2, "d" => 3, "e" => 4, "f" => 5, "g" => 6, "h" => 7, "i" => 8, "j" => 9}
    assert_equal expected,  board.diccionary
  end

  def test_if_it_can_get_a_location_on_the_gird
    board = Board.new

    assert_equal [0,1], board.grid("A2")
  end

  def test_if_it_can_get_a_location_on_the_grid_for_three_spaces_and_helper_method
    board = Board.new

    assert_equal [[0, 1], [1, 1], [2, 1]], board.grid("A2, B2, C2")
    assert_equal [[0, 1], [1, 1], [2, 1]], board.shovel_in_array(["A2", "B2", "C2"])
  end

  def test_if_it_can_hold_a_single_space_ship_and_get_coordenades
    board = Board.new
    ship = Ship.new(1)

    board.place(ship, "A2")

    assert_equal ship, board.ships.first
    assert_equal [0,1], board.ships.first.coordenades
  end

  def test_if_it_can_get_coordenades_from_ships
    board = Board.new
    ship_1 = Ship.new(3)
    ship_2 = Ship.new(2)

    board.place(ship_1, "A2 A3 A4")
    board.place(ship_2, "A1 B1")

    expected = [[0, 1], [0, 2], [0, 3], [0, 0], [1, 0] ]

    assert_equal expected, board.get_coordenades
  end

end
