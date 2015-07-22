class Movement
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
end
