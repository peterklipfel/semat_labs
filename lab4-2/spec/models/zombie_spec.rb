require 'spec_helper'

describe Zombie do
  let(:zombie){Zombie.new}
  let(:named_zombie){Zombie.new(name: "Ash Clone 1")}

  it { should respond_to(:name) }

  it 'raises an error if saved without a name' do
    expect {zombie.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'changes the number of Zombies' do
    zombie = Zombie.new(name: 'Ash')
    expect { zombie.save }.to change { Zombie.count }.from(0).to(1)
  end

  it 'starts with two weapons' do
    named_zombie.should have(2).weapons
  end

  it 'include tweets' do
    tweet1 = Tweet.new(status: 'Unh')
    tweet2 = Tweet.new(status: 'Arg')
    zombie = Zombie.new(name: 'Ash', tweets: [tweet1, tweet2])
    zombie.tweets.should include(tweet1)
    zombie.tweets.should include(tweet2)
  end

  it 'is invalid without a name' do
    zombie.should_not be_valid
  end
  it 'has a name that matches "Ash Clone"' do
    named_zombie.name.should match(/Ash Clone \d/)
  end
end
