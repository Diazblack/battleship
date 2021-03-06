require "./test/minitest_helper"

require './lib/display'
require './lib/board'
require './lib/ship'

class DisplayTest < Minitest::Test
  def test_if_exist
    board = Board.new
    screen = Display.new(board)

    screen.set(4)

    assert_instance_of Display, screen
  end

  def test_if_it_can_set_the_rows
    board = Board.new
    screen = Display.new(board)

    expected = [" ", " ", " ", " "]
    assert_equal expected, screen.set_rows(4)
  end

  def test_if_it_can_set_the_board
    board = Board.new
    screen = Display.new(board)

    screen.set(4)

    expected = [[" ", " ", " ", " "], [" ", " ", " ", " "], [" ", " ", " ", " "], [" ", " ", " ", " "]]
    assert_equal expected,  screen.board
  end

  def test_if_it_shoot_and_miss
    ship_1 = Ship.new(3)
    space = Board.new
    screen = Display.new(space)


    space.place(ship_1, "A2 A3 A4")
    screen.set(4)
    screen.shoot("A1")

    assert_equal "M", screen.board[0][0]
  end

  def test_if_it_shoot_first_miss_then_hit
    ship_1 = Ship.new(3)
    space = Board.new
    screen = Display.new(space)


    space.place(ship_1, "A2 A3 A4")
    screen.set(4)
    screen.shoot("A1")

    assert_equal "M", screen.board[0][0]

    screen.shoot("A2")

    assert_equal true, ship_1.hit?
    assert_equal "H", screen.board[0][1]
  end

  def test_if_it_shoot_two_ships
    ship_1 = Ship.new(3)
    ship_2 = Ship.new(2)
    space = Board.new
    screen = Display.new(space)


    space.place(ship_1, "A2 A3 A4")
    space.place(ship_2, "B1 B2")

    screen.set(4)
    screen.shoot("A1")

    assert_equal "M", screen.board[0][0]

    screen.shoot("A2")

    assert_equal true, ship_1.hit?
    assert_equal "H", screen.board[0][1]

    screen.shoot("B1")

    assert_equal true, ship_2.hit?
    assert_equal "H", screen.board[1][0]
  end

  def test_if_it_can_sink_a_ship
    ship_1 = Ship.new(3)
    ship_2 = Ship.new(2)
    space = Board.new
    screen = Display.new(space)


    space.place(ship_1, "A2 A3 A4")
    space.place(ship_2, "B1 C1")

    screen.set(4)
    screen.shoot("B1")
    screen.shoot("C1")

    assert_equal "H", screen.board[1][0]
    assert_equal true, ship_2.hit?
    assert_equal "H", screen.board[2][0]
    assert_equal true, ship_2.sink?
  end

end
