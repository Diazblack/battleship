class Ship
  attr_reader :ship_length


  def initialize(length)
    @ship_length = length
    @hit  =  false
    @hit_counter = 0
    @sink =  false
  end

  def hit
    @hit = true
    if @hit_counter >= @ship_length
      @sink = true
    else
      @hit_counter += 1
    end
  end

  def hit?
    @hit
  end

  def sink?
    @sink
  end
end
