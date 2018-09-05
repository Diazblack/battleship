class Board
  attr_reader :columns,
              :diccionary

  def initialize
    @columns = []
    @diccionary = {"a" => 0,"b" => 1, "c" => 2, "d" => 3, "e" => 4, "f" => 5,
                  "g" => 6, "h" => 7, "i" => 8, "j" => 9}
  end

  def grid(string)
    grid_coordenades = []
    splited_strings = string.split(", ")

      if splited_strings.length < 2
        splited_strings.each do |letter|
          grid_coordenades << @diccionary[letter[0].downcase]
          grid_coordenades << (letter[1].to_i) - 1
        end
      else
      grid_coordenades = shovel_in_array(splited_strings)
    end
      grid_coordenades
  end

  def shovel_in_array(strings)
    coordenades = []
    strings.each do |string|
      coordenades << [@diccionary[string[0].downcase], (string[1].to_i) - 1]
    end
    coordenades
  end

  def place(ship, begining)
    space = grid(begining)
    if ship.ship_length <= 1
        @columns[space[0]][space[1]] = ship
    else
      space.each do |space_1|
        @columns[space_1[0]][space_1[1]] = ship
      end
    end
  end

end
