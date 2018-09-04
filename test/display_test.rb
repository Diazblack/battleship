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

end
