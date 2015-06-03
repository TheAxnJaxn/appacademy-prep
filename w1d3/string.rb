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
