class Zombie < ActiveRecord::Base
  attr_accessor :name, :tweets
  has_many :tweets
  has_many :weapons
  validates :name, :presence => true

  def initialize(attributes=nil)
    super(attributes)
    weapons << Weapon.new
    weapons << Weapon.new
  end
end
