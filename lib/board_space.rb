

class BoardSpace
  attr_accessor :player

  def initialize
    @player = nil
  end

  def occupied?
    !@player.nil?
  end

  def player_token(player)
    player
  end
end
