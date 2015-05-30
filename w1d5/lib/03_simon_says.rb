def echo(string)
  return string
end

def shout(string)
  return string.upcase
end

def repeat(string, *num)
  answer = string + " " + string
  if num.empty? == false
    while num[0] > 2
      answer = answer + " " + string
      num[0] -= 1
    end
  end
  return answer
end

def start_of_word(string, num)
  return string[0,num]
end

def first_word(string)
  idx = 0
  word = ""
  while (string[idx] != " ")
    word = word + string[idx]
    idx += 1
  end
  return word
end

def big(word)  #defines whether or not it's a big word for next method
  if (word == "and") || (word == "the") || (word == "over") || (word =="a") || (word == "an") || (word == "is")
    return false
  else
    return true
  end
end

def titleize(string)
  array_of_string = string.split(" ")

  array_of_string.each_with_index do |word, index|
    if (index == 0) || (big(word) == true)  #if it's the start of the title, or so long as it's a big word...
      array_of_string[index] = word.capitalize  #then capitalize that word
    end
  end

  string = array_of_string.join(" ")
  return string
end