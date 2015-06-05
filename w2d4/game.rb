class Game
  attr_accessor :board, :players
  
  def initialize(player1, player2)
    @board = Board.new
    @players = [player1, player2]
  end
  
  def play
    
    counter = 1
    
    until @board.won? || @board.tied?
      current_player = @players[counter%2 - 1]
      @board.place_mark(current_player.get_position(@board), current_player.get_symbol)
      @board.print_board
      counter += 1
    end
    
    
    if @board.won?
      if counter % 2 == 1
        winner = "Computer"
      elsif counter % 2 == 0
        winner = "You"
      end
    elsif @board.tied?
      winner = "No one"
    end
    
    puts "#{winner} won the game."
    
  end
  
end