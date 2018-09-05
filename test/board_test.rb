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


  def test_if_it_can_hold_a_single_space_ship
    board = Board.new
    ship = Ship.new(1)

    board.reset(4)
    board.place(ship, "A2")

    assert_equal ship, board.columns[0][1]
    assert_equal " ", board.columns[0][2]
    assert_equal " ", board.columns[1][1]
    assert_equal " ", board.columns[2][1]
    assert_equal " ", board.columns[3][1]
  end

  def test_if_it_can_hold_a_two_spaces_ship
    board = Board.new
    ship_1 = Ship.new(2)

    board.reset(4)
    board.place(ship_1, "A2, A3")

    assert_equal ship_1, board.columns[0][1]
    assert_equal ship_1, board.columns[0][2]
    assert_equal " ", board.columns[0][3]
    assert_equal " ", board.columns[1][1]
  end

  def test_if_it_can_hold_a_two_spaces_ship_vertically

    board = Board.new
    ship_2 = Ship.new(2)

    board.reset(4)
    board.place(ship_2, "B2, C2")

    assert_equal ship_2, board.columns[1][1]
    assert_equal ship_2, board.columns[2][1]
    assert_equal " ", board.columns[3][1]
  end

end
