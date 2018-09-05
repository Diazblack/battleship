require "./test/minitest_helper"

require './lib/display'
require './lib/board'
require './lib/ship'

class DisplayTest < Minitest::Test
  def test_if_exist
    ship = Ship.new(2)
    board = Board.new

    board.reset(4)
    board.place(ship, "A2, A3")

    screen = Display.new(board)

    assert_instance_of Display, screen
  end

  def test_if_it_can_miss
    ship = Ship.new(2)
    board = Board.new

    board.reset(4)

    board.place(ship, "B2, C2")

    screen = Display.new(board)

    screen.shot("B2")

    assert_equal true, board.columns[1][1].hit?
    assert_equal "H", screen.board[1][1]

    screen.shot("A4")

    assert_equal "M", screen.board[0][3]
  end
end
