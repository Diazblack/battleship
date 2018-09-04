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
end
