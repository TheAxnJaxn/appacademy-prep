

class Player
    
    attr_accessor :symbol
    
    def get_symbol
        @symbol
    end
    
    def initialize(symbol)
        @symbol = symbol
    end
  
end

class HumanPlayer < Player
  
    def get_position(board)
        puts "Input a valid position between 1 and 9"
        input = gets.chomp.to_i
        return input
    end
  
end

class ComputerPlayer < Player
    
    def get_position(board)
      move = best_move(board)
      puts "Computer has chosen #{move}."
      return move
    end
    
    def best_move(board)
      
      (1..9).each do |pos|
        board_copy = board
        next if !board_copy.empty?(pos)
        board_copy.place_mark(pos, @symbol)
        if board_copy.won?
          board_copy.remove_mark(pos)
          return pos
        end
        board_copy.remove_mark(pos)
      end
      
      move = rand(9) + 1
      until board.empty?(move)
        move = rand(9) + 1
      end
      move
      
    end
  
end