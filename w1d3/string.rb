def num_to_s(num, base)
  string_version = ""
  divide_by = 1
  string_digits = { 0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4", 5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9", 10 => "A", 11 => "B", 12 => "C", 13 => "D", 14 => "E", 15 => "F" }
  
  until num / divide_by == 0
    string_version << string_digits[(num / divide_by) % base]
    divide_by *= base
  end
  
  return string_version.reverse
  
end

def caesar(string, num)
  
  idx = 0
  
  while idx < string.length
    new_letter_value = string[idx].ord + num
    
    while new_letter_value > 122  # keeps within the range of lowercase a - z
      new_letter_value = new_letter_value - 26
    end
    
    string[idx] = new_letter_value.chr # resets the current letter to it's new letter
    idx += 1
  end
  
  return string
  
end
