require_relative "class_GameBoard"
require_relative "class_Player"

puts "New game of tictactoe! Prepare yourself..."
puts "Enter the name of player 1:"
player1_name = gets.chomp
puts "Now enter the name of player 2:"
player2_name = gets.chomp

player1 = Player.new(player1_name)
player2 = Player.new(player2_name)

game1 = GameBoard.new(player1,player2)

gameplay = true
while gameplay
  puts "#{game1.current_player.name}'s turn. Enter your piece's row position:"
  play_choice_x = gets.chomp.to_i
  puts "Now enter your column position:"
  play_choice_y = gets.chomp.to_i
  game1.update_board([play_choice_x,play_choice_y])

end
