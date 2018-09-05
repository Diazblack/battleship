class Display
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def print
    letters = ["A","B","C", "D"]
    p "==========="
    p ". 1 2 3 4"
    4.times do |i|
      puts "#{letters[i]} #{@board.columns[i].join(" ")}"
    end
    p "==========="
  end

  def shot(string)
        binding.pry
    position = @columns.grid(string)

    if @columns[position[0]][position[1]] == " "
      @board[position[0]][position[1]] = "M"
    else
      @columns[position[0]][position[1]].hit
      @board[position[0]][position[1]] = "H"
    end
  end
end
