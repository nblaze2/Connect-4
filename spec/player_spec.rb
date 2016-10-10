require 'spec_helper'

describe Player do
  it "has a name" do
    player = Player.new('Nick', 'X')
    expect(player.name).to eq('Nick')
  end

  it "has a token" do
    player = Player.new('Nick', 'X')
    expect(player.token).to eq('X')
  end

  it "has another name and token" do
    player = Player.new('Marina', 'O')
    expect(player.name).to eq('Marina')
    expect(player.token).to eq('O')
  end
end
