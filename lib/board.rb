require "./lib/ship"

class Board
  attr_reader :ships,
              :diccionary

  def initialize
    @ships = []
    @diccionary = {"a" => 0,"b" => 1, "c" => 2, "d" => 3, "e" => 4, "f" => 5,
                  "g" => 6, "h" => 7, "i" => 8, "j" => 9}
  end

  def grid(string)
    grid_coordenades = []
    splited_strings = string.split(" ")

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

  def place(ship, coordenades)
    space = grid(coordenades)
    ship.set_coordenades(space)
    @ships << ship
  end

  def get_coordenades
    ship_coordenades = []
    @ships.first.coordenades.each do |coordenade|
      ship_coordenades << coordenade
    end
    if @ships.length > 1
      @ships.last.coordenades.each do |coordenade|
        ship_coordenades << coordenade
      end
    end
    ship_coordenades
  end
end
