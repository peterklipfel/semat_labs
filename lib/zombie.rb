class Zombie
  attr_accessor :name, :brains

  def hungry?
    true
  end

  def initialize
    @name = "Ash"
    @brains = 0
  end
end