class Robot
  require 'movement'

  attr_reader :position, :tabletop

  def initialize
    @position = nil
    @tabletop = nil
  end

  end

  def move
    return false unless @tabletop
    new_position = Movement.move @position, 1
    if @tabletop.valid_position? new_position.x, new_position.y
      @position = new_position
      true
    else
      false
    end
  end

  def turn direction
    return false unless @tabletop
    @position.facing = Movement.turn @position.facing, direction.downcase.to_sym
    true
  end

  private

  def valid_placement? position, tabletop
    tabletop.valid_position?(position.x, position.y) && Movement.valid_direction?(position.facing)
  end
end
