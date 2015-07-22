class Robot
  require 'movement'

  attr_reader :position, :tabletop

  def initialize
    @position = nil
    @tabletop = nil
  end

  def place position, tabletop=nil
    tabletop = tabletop || @tabletop #can place on new tabletop
    raise 'robot has no tabletop' unless tabletop
    if valid_placement? position, tabletop
      @position = position
      @tabletop = tabletop
      true
    else
      false
    end
  end

  private

  def valid_placement? position, tabletop
    tabletop.valid_position?(position.x, position.y) && Movement.valid_direction?(position.facing)
  end
end
