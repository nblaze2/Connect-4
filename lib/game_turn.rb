# class GameTurn
#   attr_reader :board, :player, :row_index, :col_index
#
#   def initialize(board, player, row_index, col_index)
#     @board = board
#     @player = player
#     @row_index = row_index
#     @col_index = col_index
#   end
#
#   # def add_turn(player, row_index, col_index)
#   #   @last_turn = GameTurn.new(self, player, row_index, col_index)
#   #   @last_turn.drop_token
#   # end
#
#   # def take!
#   #   @board.rows[@row_index][@col_index].player = @player
#   # end
#
#   def winner?
#     horizontal_win? || vertical_win?
#   end
#
#   def horizontal_win?
#     victory = true
#     board.rows[row_index].each do |space|
#       victory = false if space.player != @player
#     end
#     victory
#   end
#
#   def vertical_win?
#     victory = true
#     board.rows.each do |row|
#       victory = false if row[col_index].player != @player
#     end
#     victory
#   end
# end
