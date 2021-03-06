require_relative 'player'
require_relative 'board'
require_relative 'game_turn'
require 'pry'

puts ""
puts "Hello! Let's play of game of Connect-4 (please don't sue me...)"
puts ""
print "What is your name? "
red_name = gets.chomp.downcase.capitalize
puts ""
puts "Hello #{red_name}! Nice to meet you."
puts ""
print "What is the name of your opponent? "
black_name = gets.chomp.downcase.capitalize
while red_name == black_name
  puts "I'm sorry it would be too confusing to have you both have the same name!"
  print "Please choose another name for me to call you. "
  black_name = gets.chomp.downcase.capitalize
end
puts ""
puts "Hello #{black_name}! Nice to meet you too."
puts ""

x_player = Player.new(red_name, 'X')
o_player = Player.new(black_name, 'O')

board = Board.new

players = [x_player, o_player].shuffle

turn_index = 0

puts board.print
puts ""
while board.empty_spaces?  && !board.winner?
  current_player = players[turn_index]
  puts "It is #{current_player.name}'s turn."

  print "What column do you want to play? "
  letter_index = gets.chomp.upcase
  while board.wrong_letter?(letter_index)
    puts ""
    print "I'm sorry that isn't a valid choice, please choose a valid column: "
    letter_index = gets.chomp.upcase
  end


  if board.drop_token?(letter_index, current_player)
    puts ""
    puts board.print
    puts ""

    if board.winner?
      puts ""
      puts "#{current_player.name}! You won!!! Good game."
      break
    end

    turn_index = turn_index == 0 ? 1 : 0
  else
    puts ""
    puts "That column is full"
  end
end

if !board.empty_spaces?  && !board.winner?
  puts ""
  puts "It's a tie!"
end
