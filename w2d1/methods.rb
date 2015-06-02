# Implement a Rock, Paper, Scissors game.

def rps(rps_string)
  
  options = ["Rock", "Paper", "Scissors"]
  computers_response = options[rand(3)]
  
  results = computers_response + ", "  
  results << who_won(rps_string, computers_response)
  
  return results
  
end

def who_won(rps_string, computers_response)
  
  if rps_string == computers_response
    return "Draw"
  elsif (rps_string == "Rock" && computers_response == "Scissors") || (rps_string == "Paper" && computers_response == "Rock") || (rps_string == "Scissors" && computers_response == "Paper")
    return "Win"
  else
    return "Lose"
  end
  
end

# Implement a Mixology game.

def remix(ingredient_arrays)
  
  mixers = []
  
  ingredient_arrays.each do |array|
    mixers << array[1]
  end
  
  ingredient_arrays.each do |array|
    idx = rand(mixers.length)
    array[1] = mixers[idx]
    mixers.delete_at(idx)
  end
  
  return ingredient_arrays
  
end
