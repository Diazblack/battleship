require "./test/minitest_helper"

require './lib/display'
require './lib/board_space'
require './lib/ship'

class DisplayTest < Minitest::Test
  def test_if_exist
    ship = Ship.new(3)
    board = BoardSpace.new

    board.reset(4)

    screen = Display.new(board)

    assert_instance_of Display, screen
  end

  def test_if_it_can_display_an_empty_board
    ship = Ship.new(3)
    board = BoardSpace.new

    board.reset(4)
    board.place(ship, "B2, C2")

    screen = Display.new(board)

    expected = [[". 1 2 3 4"], ["A"], ["B"], ["C"], ["D"]]

    assert_equal expected, screen.print
  end

end
