module ToyRobot
  module Movement
    Facings = [
      :North,
      :East,
      :South,
      :West
    ]

    def valid_facing? facing
      Facings.include? facing
    end

    def turn direction
      return unless @position #ignore turn until placed
      if direction == :right
        index = (Facings.index(@position.facing) + 1) % Facings.count
        @position.facing = Facings[index]
      elsif direction == :left
        index = (Facings.index(@position.facing) - 1) % Facings.count
        @position.facing = Facings[index]
      else
        raise "Cannot turn direction '#{direction}'"
      end
    end

    # southwest corner 0,0
    def new_position
      result = @position.dup
      case result.facing
      when :North
        result.y += @speed
        result
      when :East
        result.x += @speed
        result
      when :South
        result.y -= @speed
        result
      when :West
        result.x -= @speed
        result
      else
        raise "Do not know how to move from current position #{position.to_s}"
      end
    end
  end
end
