module ToyRobot
  class Robot
    include Movement
    attr_accessor :position, :tabletop

    def initialize speed=1
      @position = nil
      @tabletop = nil
      @speed = speed
    end

    def report
      if @tabletop.nil?
        'Robot not on a tabletop'
      else
        "#{@position.x},#{@position.y},#{@position.facing.upcase}"
      end
    end
  end
end
