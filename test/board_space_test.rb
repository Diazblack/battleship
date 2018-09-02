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

  def test_if_it_can_hold_a_single_space_ship
    board = BoardSpace.new
    ship = Ship.new(1)

    board.reset(4)
    board.place(ship, "A2")

    assert_equal ship, board.columns[0][1]

  end


end
