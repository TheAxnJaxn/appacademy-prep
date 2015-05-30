def change(word)

  if word[0].match(/[aeiou]/)
    word << "ay"
    return word
  elsif (word[0] == "q" && word[1] == "u")
    word << word[0] << word[1]
    word[0] = ""
    word[0] = ""
    change(word)
  else
    word << word[0]
    word[0] = ""
    change(word)
  end

end

def translate(string)

  array_of_string = string.split(" ")

  array_of_string.each_with_index do |word, index|
      array_of_string[index] = change(word)
  end

  return array_of_string.join(" ")

end