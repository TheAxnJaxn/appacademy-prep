class RPNCalculator
  
  def initialize
    @array = []
  end
  
  def push(int)
    @array << int
  end
  
  def pop
    num = @array.pop
    if num == nil
      raise "calculator is empty"
    end
    num
  end
  
  def plus
    @array << pop + pop
  end
  
  def minus
    @array << - pop + pop
  end
  
  def times
    @array << pop*pop
  end
  
  def divide
    value1 = pop.to_f
    value2 = pop.to_f
    @array << value2/value1
  end
  
  def value
    return @array[-1]
  end
  
  def tokens(string)
    array = string.split(" ")
    
    array.map! do |obj|
      if %q[+ - * /].include?(obj)
        obj.to_sym
      else
        obj.to_i
      end
    end
    array
  end
  
  def evaluate(string)
    calculate_this = tokens(string)
    
    calculate_this.each do |obj|
      if obj == :+
        plus
      elsif obj == :-
        minus
      elsif obj == :*
        times
      elsif obj == :/
        divide
      else
        @array << obj
      end
    end
    return value
  end
  
end

calculator = RPNCalculator.new

if ARGV[0] == nil
  puts "Please enter values"
  string = ""
  element = gets
  string << "#{element} "
  while element != "\n"
    element = gets
    string << "#{element} "
  end
  print "Answer: "
  puts calculator.evaluate(string)
else
  contents = File.readlines("calculator_instructions.txt")
  contents.each do |line|
    puts calculator.evaluate(line)
  end
end
