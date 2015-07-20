class Tabletop
  attr_reader :height, :width

  def initialize(height=5,width=5)
    @height = height
    @width = width
  end

  def valid_position? x, y
    return false if invalid_x? x
    return false if invalid_y? y
    true
  end

  private

  def invalid_x? x
    x < 0 or x > @width
  end

  def invalid_y? y
    y < 0 or y > @height
  end

end
