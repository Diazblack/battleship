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

  # def shoot(string)
  #   position = @ships_location.grid(string)
  #   @ships_location.get_coordenades.each_with_index do |data, i|
  #     board[position[0]][position[1]] = "M"
  #     if data == position && i <= 2
  #       @ships_location.ships[0].hit
  #       return board[position[0]][position[1]] = "H"
  #     elsif data == position && i > 2
  #       @ships_location.ships[1].hit
  #       return board[position[0]][position[1]] = "H"
  #     end
  #   end
  # end

  def shoot(string)
    position = @ships_location.grid(string)
    @ships_location.get_coordenades.each_with_index do |data, i|
      print_state(data, i, position)
    end
  end




  def print_state(data, i, position)
    board[position[0]][position[1]] = "M"
    if data == position && i <= 2
      @ships_location.ships[0].hit
      return board[position[0]][position[1]] = "H"
    elsif data == position && i > 2
      @ships_location.ships[1].hit
      return board[position[0]][position[1]] = "H"
    end
  end

end
