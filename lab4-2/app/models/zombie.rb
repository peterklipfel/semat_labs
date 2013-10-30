class Zombie < ActiveRecord::Base
  attr_accessor :name, :tweets, :brains
  has_many :tweets
  has_many :weapons
  validates :name, :presence => true

  def initialize(attributes=nil)
    super(attributes)
    @name = 'Ash'
    
    tweet1 = Tweet.new(status: 'Unh')
    tweet2 = Tweet.new(status: 'Arg')
    self.tweets << tweet1 << tweet2
  end
end
