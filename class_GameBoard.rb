# class declaration for tictactoe game board
class GameBoard
  attr_reader :player1, :player2, :board, :current_player, :winner

  @@board_count = 0

  def initialize(player1,player2)
    player1.game_board = self
    player2.game_board = self

    player1.piece = 'X'
    player2.piece = 'O'
    @player1 = player1
    @player2 = player2

    @scoreboard = { player1: 0, player2: 0 }
    @@board_count += 1

    clear_board
  end

  def update_board(choice)
    # choice = choice.to_a
    if choice.all? { |x| !x.instance_of?(Integer) } || choice.length != 2 || choice.class != Array
      puts 'Invalid input! Try again'
    elsif @board[choice[0]][choice[1]] != '#'
      puts 'Invalid choice! Try again'
    else
      @board[choice[0]][choice[1]] = @current_player.piece
      @board.each { |x| p x }
      puts ''
      check_for_winner
      @current_player = @current_player == @player1 ? @player2 : @player1
    end
  end

  def check_for_winner
    if @board.any?{ |x| x.all?(@current_player.piece) } || @board.transpose.any?{ |x| x.all?(@current_player.piece) } || [@board[0][0],@board[1][1],@board[2][2]].all?(@current_player.piece) || [@board[0][2], @board[1][1], @board[2][0]].all?(@current_player.piece)
      puts "#{@current_player.name} wins!!"
      @winner = @current_player.name
      @board = Array.new(3) { Array.new(3, '#') }
    end
  end

  def clear_board
    @winner = false
    @current_player = @player1
    @board = Array.new(3) { Array.new(3, '#') }
    
    puts "#{@player1.name} is X, #{@player2.name} is O"
    puts "New Game"

    @board.each { |x| p x }
    puts ''
  end
end