class Display
  attr_reader :board

  def initialize
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

  def shot(string)
    position = @columns.grid(string)

    if @columns[position[0]][position[1]] == " "
      @board[position[0]][position[1]] = "M"
    else
      @columns[position[0]][position[1]].hit
      @board[position[0]][position[1]] = "H"
    end
  end
end
