require './test/minitest_helper'

require './lib/board_space'
require './lib/ship'

class BoardSpaceTest < Minitest::Test

  def test_if_exist
    board = BoardSpace.new

    assert_instance_of BoardSpace,  board

  end

  def test_if_it_can_hold_rows_and_columns_by_default
    board = BoardSpace.new

    assert_equal [],  board.rows
    assert_equal [],  board.columns

  end

  def test_if_it_can_hold_a_diccionary
    board = BoardSpace.new

    expected = {"a" => 0,"b" => 1, "c" => 2, "d" => 3, "e" => 4, "f" => 5, "g" => 6, "h" => 7, "i" => 8, "j" => 9}
    assert_equal expected,  board.diccionary
  end

  def test_if_it_can_reset_the_rows
    board = BoardSpace.new

    board.reset_rows(4)

    expected = [" ", " ", " ", " "]
    assert_equal expected,  board.rows
  end

  def test_if_it_can_reset_the_board
    board = BoardSpace.new

    board.reset(4)

    expected = [[" ", " ", " ", " "], [" ", " ", " ", " "], [" ", " ", " ", " "], [" ", " ", " ", " "]]
    assert_equal expected,  board.columns
  end

  def test_if_it_can_get_a_location_on_the_gird
    board = BoardSpace.new

    assert_equal [0,1], board.grid("A2")
  end

  def test_if_it_can_hold_a_single_space_ship
    board = BoardSpace.new
    ship = Ship.new(1)

    board.reset(4)
    board.place(ship, "A2")

    assert_equal ship, board.columns[0][1]
  end
end
