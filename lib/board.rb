class Board
  attr_reader :rows

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
    @rows = [
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil]
    ]
  end

  def drop_token(letter, token)
    index = LETTERS[letter]
    n = 5
    while @rows[n][index] != nil && n >= 0
      n -= 1
    end
    @rows[n][index] = token
  end
end
