require 'spec_helper'


describe BoardSpace do
  let(:space) { BoardSpace.new }
  it "is occupied if a player has played there" do
    space.player = Player.new('Nick', 'X')
    expect(space).to be_occupied
  end

  it "is not occupied if a player has not played there" do
    expect(space).to_not be_occupied
  end

  it "has a player if one is assigned to it" do
    player = Player.new('Nick', 'X')
    space.player = player
    expect(space.player).to eq(player)
  end

  # it "represents the player occupying it as a string" do
  #   player = Player.new('Nick')
  #   space.player = player
  #   expect(space.player_token).to eq('X')
  # end

  # it "represents an empty space if it is empty as a string" do
  #   expect(space.to_char).to eq('-')
  # end
end
