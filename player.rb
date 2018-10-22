class Player
  attr_accessor :lives, :name

  def initialize(name)
    @lives = 3
    @name = name
  end

  def take_life
    @lives = @lives - 1
  end
end