class Movement
  require 'position'

  Directions = [
    :North,
    :East,
    :South,
    :West
  ]

  def self.valid_direction? direction
    Directions.include? direction.capitalize.to_sym
  end

  def self.turn current_facing, direction
    raise "current_facing: #{current_facing} must be one of #{Directions.to_s}" unless valid_direction? current_facing
    if direction == :right
      index = (Directions.index(current_facing) + 1) % Directions.count
      Directions[index]
    elsif direction == :left
      index = (Directions.index(current_facing) - 1) % Directions.count
      Directions[index]
    else
      raise "direction must be either :right or :left"
    end
  end

  # southwest corner 0,0
  def self.move position, distance
    case position.facing
    when :North
      position.y += distance
      position
    when :East
      position.x += distance
      position
    when :South
      position.y -= distance
      position
    when :West
      position.x -= distance
      position
    else
      raise "Do not know how to move from current position #{position.to_s}"
    end
  end
end
