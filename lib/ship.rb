class Ship
  attr_reader :ship_length,
              :coordenades


  def initialize(length)
    @ship_length = length
    @coordenades = 0
    @hit  =  false
    @hit_counter = 0
    @sink =  false
  end

  def get_coordenades(array)
    @coordenades = array
  end
  
  def hit
    @hit = true
    @hit_counter += 1
    sink
  end

  def hit?
    @hit
  end

  def sink
    if @hit_counter >= @ship_length
      @sink = true
    end
  end

  def sink?
    @sink
  end
end
