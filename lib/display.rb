require "./lib/board"
require "./lib/ship"

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
###necesita ser acomodado para acomodar 2 barcos y arrglar el problema de impresion
  def shoot(string)
    position = @ships_location.grid(string)
    @ships_location.get_coordenades.each do |data|
      if data == position
        @ships_location.ships[0].hit
        board[position[0]][position[1]] = "H"
      else
        board[position[0]][position[1]] = "M"
      end
    end
  end
end
