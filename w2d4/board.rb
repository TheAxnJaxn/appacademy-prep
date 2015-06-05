class Board
  
  attr_accessor :board
  WINNING_CONDITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  
  def initialize()
    @board = {1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0, 8 => 0, 9 => 0}
  end
  
  def won?
    WINNING_CONDITIONS.any? do |condition|
      condition_met?(condition)
    end
  end
  
  def tied?
    !@board.values.include?(0)
  end
  
  def empty?(position)
    @board[position] == 0
  end
  
  def place_mark(position, mark)
    if empty?(position)
      @board[position] = mark
    else
      puts "The position is occupied."
    end
  end

  def show
    return @board
  end
  
  def remove_mark(position)
    @board[position] = 0
  end
  
  def print_board
    puts "#{@board[1]} | #{@board[2]} | #{@board[3]}"
    puts "#{@board[4]} | #{@board[5]} | #{@board[6]}"
    puts "#{@board[7]} | #{@board[8]} | #{@board[9]}"
  end
  
  private
  
  def condition_met?(condition)
    @board[condition[0]] == @board[condition[1]] && @board[condition[1]] == @board[condition[2]] && @board[condition[0]] != 0
  end
  
end