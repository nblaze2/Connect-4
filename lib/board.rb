require_relative 'board_space'
require_relative 'game_turn'
require 'pry'

class Board
  attr_reader :rows, :row_index

  LETTERS = {
    'A' => 0,
    'B' => 1,
    'C' => 2,
    'D' => 3,
    'E' => 4,
    'F' => 5,
    'G' => 6
  }

  def initialize
    @rows = []
    6.times do
      row = []
      7.times do
        row << BoardSpace.new
      end
      @rows << row
    end
  end

  def drop_token(letter, player)
    index = LETTERS[letter]
    n = 5
    # binding.pry
    while @rows[n][index].occupied? && n != 0
      n -= 1
    end
    @row_index = n
    @rows[@row_index][index].player = @rows[n][index].player_token(player)
  end

  def wrong_letter?(letter)
    !LETTERS.include?(letter)
  end

  def empty_spaces?
    @rows.each do |row|
      row.each do |space|
        return true if !space.occupied?
      end
    end
    return false
  end
#
#   def winner?
#     if @last_turn
#       @last_turn.winner?
#     else
#       false
#     end
#   end
#
  def print
    board_print = ""
    @rows.each_with_index do |row, index|
      spots = []
      row.each do |space|
        if space.player.nil?
          spots << ' '
        elsif space.player != nil
          spots << space.player.token
        end
      end
      board_print << '|' + spots.join(' ') + '|' + "\n"
    end
    board_print << ' A B C D E F G '
    board_print
  end
end
