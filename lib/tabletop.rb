module ToyRobot
  class Tabletop
    attr_reader :height, :width

    def initialize(height=5,width=5)
      @height = height
      @width = width
      @toys = []
    end

    def add_toy toy, position
      if valid_position?(position) && toy.valid_facing?(position.facing)
        @toys.push toy unless has_toy? toy
        toy.position = position
        toy.tabletop = self
      end
    end

    def has_toy? toy
      @toys.include? toy
    end

    def valid_position? position
      valid_x?(position.x) && valid_y?(position.y)
    end

    private

    def valid_x? x
      x >= 0 and x <= @width
    end

    def valid_y? y
      y >= 0 and y <= @height
    end
  end
end
