require "./test/minitest_helper"

require './lib/display'
require './lib/board'
require './lib/ship'

class DisplayTest < Minitest::Test
  def test_if_exist
    ship = Ship.new(2)
    board = Board.new
    screen = Display.new

    screen.set(4)

    assert_instance_of Display, screen
  end

  def test_if_it_can_set_the_rows
    screen = Display.new

    expected = [" ", " ", " ", " "]
    assert_equal expected, screen.set_rows(4)
  end

  def test_if_it_can_set_the_board
    screen = Display.new

    screen.set(4)

    expected = [[" ", " ", " ", " "], [" ", " ", " ", " "], [" ", " ", " ", " "], [" ", " ", " ", " "]]
    assert_equal expected,  screen.board
  end

  def test_if_it_can_set_the_board
    screen = Display.new

    screen.set(4)
    binding.pry
  end


end
