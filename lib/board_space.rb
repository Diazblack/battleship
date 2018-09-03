class BoardSpace
  attr_reader :rows,
              :columns,
              :diccionary

  def initialize
    @rows = []
    @columns = []
    @diccionary = {"a" => 0,"b" => 1, "c" => 2, "d" => 3, "e" => 4, "f" => 5,
                  "g" => 6, "h" => 7, "i" => 8, "j" => 9}
  end

  def reset(number)
    number.times do |x|
      @columns[x] = reset_rows(number)
    end
  end

  def reset_rows(number)
    number.times do |y|
      @rows[y] = " "
    end
    @rows
  end

  def grid(string)
    grid_coordenades = []
    grid_coordenades << @diccionary[string[0].downcase]
    grid_coordenades << (string[1].to_i) - 1
  end

  def place(ship, begining, end_position = "")
    if ship.ship_length <= 1
      space = grid(begining)

      @columns[space[0]][space[1]] = ship
    else
      space_1 = grid(begining)
      space_2 = grid(end_position)

      @columns[space_1[0]][space_1[1]] = ship
      @columns[space_2[0]][space_2[1]] = ship
    end
  end


end
