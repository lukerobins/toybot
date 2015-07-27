module ToyRobot
  class Controller
    def initialize tabletop, robot
      @tabletop = tabletop
      @robot = robot
    end

    def place x,y,facing
      position = Position.new(x,y,facing)
      @tabletop.add_toy @robot, position
    end

    def move
      @robot.move
    end

    def report
      @robot.report
    end

    def left
      @robot.turn :left
    end

    def right
      @robot.turn :right
    end
  end
end
