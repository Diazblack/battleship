class BoardSpace
  attr_reader :rows,
              :columns

  def initialize
    @rows = []
    @columns = []
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

end
