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

  def drop_token?(letter, dropping_player)
    index = LETTERS[letter]
    n = 5
    while @rows[n][index].occupied?
      n -= 1
      if n < 0
        return false
      end
    end
    while @rows[n][index].occupied?
      n -= 1
    end
    if n >= 0
      @row_index = n
      @rows[@row_index][index].player = dropping_player
      return true
    end

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

  def winner?
    horizontal_win? || vertical_win? || diagonal_up_right_win? || diagonal_down_right_win?
  end

  def horizontal_win?
    r = 0
    while r < 6
      c = 0
      tally = 0
      while c < 6
        if @rows[r][c].player == @rows[r][c + 1].player && @rows[r][c].player != nil
          tally += 1
          if tally == 3
            return true
          end
        else
          tally = 0
        end
        c += 1
      end
      r += 1
    end
    return false
  end

  def vertical_win?
    c = 0
    while c < 7
      r = 0
      tally = 0
      while r < 5
        if @rows[r][c].player == @rows[r + 1][c].player && @rows[r][c].player != nil
          tally += 1
          if tally == 3
            return true
          end
        else
          tally = 0
        end
        r += 1
      end
      c += 1
    end
    return false
  end

  def diagonal_up_right_win?
    r = 5
    tally = 0
    while r > 2
      c = 0
      while c < 4
        if @rows[r][c].player != nil && @rows[r][c].player == @rows[r - 1][c + 1].player && @rows[r][c].player == @rows[r - 2][c + 2].player && @rows[r][c].player == @rows[r - 3][c + 3].player
          return true
        end
        c += 1
      end
      r -= 1
    end
    return false
  end

  def diagonal_down_right_win?
    r = 0
    tally = 0
    while r < 3
      c = 0
      while c < 4
        if @rows[r][c].player != nil && @rows[r][c].player == @rows[r + 1][c + 1].player && @rows[r][c].player == @rows[r + 2][c + 2].player && @rows[r][c].player == @rows[r + 3][c + 3].player
          return true
        end
        c += 1
      end
      r += 1
    end
    return false
  end

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
