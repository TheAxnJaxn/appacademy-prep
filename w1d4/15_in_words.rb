class Fixnum

  def in_words
  
    output = []
    self_num = self

    one = ["one","two","three","four","five","six","seven","eight","nine"]
    ten = ["twenty", "thirty","forty","fifty","sixty","seventy","eighty","ninety"]
    teen = ["ten", "eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]
    numbers = { 1000000000000 => "trillion",1000000000 => "billion",1000000 => "million",1000 => "thousand", 100 => "hundred"}
  
    return "zero" if self_num == 0   
    
    numbers.each do |key, definition|
    
      if self_num >= key
        current_num = self_num/key
        output << current_num.in_words << definition
        self_num -= (current_num * key)
      end
     
    end
   
    
    if self_num.to_s.length == 1 && self_num > 0          # 0 - 10
      output << one[self_num - 1]
    elsif (self_num.to_s.length == 2) && (self_num < 20)  # 10 - 19
      output << teen[self_num - 10]
    elsif (self_num.to_s.length == 2) && (self_num >= 20) # 20 - 99
      tens_digit = self_num / 10
      ones_digit = self_num - tens_digit * 10
      output << ten[tens_digit - 2]
      output << one[ones_digit - 1] if ones_digit > 0
    end
    
    return output.join(" ")
    
  end
    
end
