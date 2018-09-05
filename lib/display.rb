require "./lib/board"

class Display
  attr_reader :board,
              :ships_location

  def initialize(ships)
    @ships_location = ships
    @board = []
  end

  def set(number)
    number.times do |x|
      @board[x] = set_rows(number)
    end
  end

  def set_rows(number)
    rows = []
    number.times do |y|
      rows[y] = " "
    end
    rows
  end

  def print
    letters = ["A","B","C", "D"]
    p "==========="
    p ". 1 2 3 4"
    4.times do |i|
      puts "#{letters[i]} #{@board[i].join(" ")}"
    end
    p "==========="
  end

  def shoot(string)
    position = @ships_location.grid(string)
    if @board[position[0]][position[1]] == " "
      @board[position[0]][position[1]] = "M"
    else
      @columns[position[0]][position[1]].hit
      @board[position[0]][position[1]] = "H"
    end
  end
end
