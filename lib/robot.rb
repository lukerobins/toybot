class Robot
  require 'position'

  attr_reader :position, :tabletop

  def initialize
    @position = nil
    @tabletop = nil
  end
end
