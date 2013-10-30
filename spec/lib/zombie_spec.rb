require 'spec_helper'
require 'zombie'
describe Zombie do
  let(:zombie){ Zombie.new }
  it "is hungry" do
    zombie.should be_hungry
  end
  it "is named Ash" do
    zombie.name.should == "Ash"
  end
  it "has no brains" do
    zombie.brains.should < 1
  end
  it "is dead" do
    pending
  end
end
