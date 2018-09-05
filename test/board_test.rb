require './test/minitest_helper'

require './lib/board'
require './lib/ship'

class BoardTest < Minitest::Test

  def test_if_exist
    board = Board.new

    assert_instance_of Board,  board

  end

  def test_if_it_can_hold_rows_and_columns_by_default
    board = Board.new

    assert_equal [],  board.columns

  end

  def test_if_it_can_hold_a_diccionary
    board = Board.new

    expected = {"a" => 0,"b" => 1, "c" => 2, "d" => 3, "e" => 4, "f" => 5, "g" => 6, "h" => 7, "i" => 8, "j" => 9}
    assert_equal expected,  board.diccionary
  end

  def test_if_it_can_reset_the_rows
    board = Board.new

    board.reset_rows(4)

    expected = [" ", " ", " ", " "]
    assert_equal expected,  board.reset_rows(4)
  end

  def test_if_it_can_reset_the_board
    board = Board.new

    board.reset(4)

    expected = [[" ", " ", " ", " "], [" ", " ", " ", " "], [" ", " ", " ", " "], [" ", " ", " ", " "]]
    assert_equal expected,  board.columns
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

  def test_if_it_can_take_a_hit_and_then_miss
    board = Board.new
    ship_2 = Ship.new(2)

    board.reset(4)
    board.place(ship_2, "B2, C2")

    board.shot("B2")

    assert_equal true, board.columns[1][1].hit?

    board.shot("A4")

    assert_equal "M", board.columns[0][3]
  end

end
