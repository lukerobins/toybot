module ToyRobot
  class Robot
    include Movement
    attr_accessor :position, :tabletop
    attr_reader :speed

    def initialize speed=1
      @position = nil
      @tabletop = nil
      @speed = speed
    end

    def move
      if ! @tabletop.nil? && @tabletop.valid_position?(new_position)
        @position = new_position
      end
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
