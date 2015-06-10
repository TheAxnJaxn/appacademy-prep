class Game # keeps track of random code, turns, and prompts user for input
  
  attr_accessor :code, :turn
  
  def initialize
    @code = Code.random
    @turn = 0
  end
  
  def play
    
    while @turn < 10
    
      users_guess = Code.parse
      
      if code.exact_matches(users_guess) == 4
        puts "Congrats!"
        return
      end
      
      puts "Near matches: #{code.exact_matches(users_guess)}. Exact matches: #{code.near_matches(users_guess)}."
      @turn += 1
      
    end
    
    puts "You lose!"
    
  end
  
end

class Code  # sequence of four pegs

  attr_accessor :code

  Colors = %w(R G B Y O P)

  def initialize
    @code = []
  end

  def self.random
    code = Code.new
    4.times { code.code << Colors.sample }
    code
  end
  
  def self.valid?(input)
    # checking that it's 4 letters and that it's only RGBYOP
    if input.length != 4
      raise "That was the wrong number of colors"
    elsif input.match(/[^RGBYOP]/)
      raise "You entered an invalid color"
    end
  end
  
  def self.parse # take input like RGBY and build Code object
  input = ""
    loop do
      print "Enter 4 colors (RGBYOP): "
      input = gets.chomp.upcase!
      begin
        valid?(input)
        break
      rescue RuntimeError => e
        puts e
      end
    end
    
    code = Code.new
    input.scan(/./) do |letter|
      code.code << letter
    end
    code
  end
  
  def exact_matches(other)
    num_matches = 0
    4.times do |n|
      num_matches += 1 if code[n] == other.code[n]
    end
    num_matches
  end
  
  def near_matches(other)
    num_matches = 0
    other.code.each_with_index do | guess, idx |
      if (code[idx] != other.code[idx])
        num_matches += 1 if code.include?(guess)
      end
    end
    num_matches
  end
  
end


g = Game.new
g.play
