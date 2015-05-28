# Write a Towers of Hanoi game.

# Keep three arrays, which represents the piles of discs. Pick a representation of the discs to store in the arrays; maybe just a number representing their size. Don't worry too much about making the user interface pretty.
# In a loop, prompt the user (using gets) and ask what pile to select a disc from, and where to put it.
# After each move, check to see if they have succeeded in moving all the discs to the final pile. If so, they win!

def add_disks(disks)
  stacked = []
  disks = disks
  while disks > 0
    stacked.unshift(disks)
    disks -= 1
  end
  return stacked
end

def show_towers(tower1, tower2, tower3)
  towers = tower1.join(" ") + "  |  " + tower2.join(" ") + "  |  " + tower3.join(" ")
  return towers
end

def is_finished?(tower1, tower2, tower3)
  if (tower1.empty? && tower2.empty?) || (tower1.empty? && tower3.empty?)
    return true
  else
    return false
  end
end

puts "Welcome to the Towers of Hanoi"
puts "How many disks would you like?"

num = gets.chomp.to_i

tower1 = add_disks(num)
tower2 = []
tower3 = []

puts "Your Tower of Hanoi currently looks like this: " + show_towers(tower1, tower2, tower3)

while is_finished?(tower1, tower2, tower3) == false
  puts
  puts "Which tower would you like to move from? Enter 1, 2, or 3."
  from_tower = gets.chomp.to_i
  
  #Make sure they aren't moving from an empty array
  while (from_tower == 1 && tower1.empty?) || (from_tower == 2 && tower2.empty?) || (from_tower == 3 && tower3.empty?)
    puts "That tower is empty. Please pick another tower."
    from_tower = gets.chomp.to_i
  end
  
  puts "Which tower would you like to move to? Enter 1, 2, or 3."
  to_tower = gets.chomp.to_i
  
  #If they've entered the same tower both times, request a new to_tower from the user
  if (to_tower == from_tower)
    puts "You want to move the top disk from tower #{from_tower}. Please enter the tower number other than tower #{from_tower} where you'd like the disk moved."
    to_tower = gets.chomp.to_i
  end
  
  #Check that the disk size is correct to move
  if (from_tower == 1 && to_tower == 2 && !tower2.empty? && tower1[0] > tower2[0]) || (from_tower == 1 && to_tower == 3 && !tower3.empty? && tower1[0] > tower3[0]) || (from_tower == 2 && to_tower == 1 && !tower1.empty? && tower2[0] > tower1[0]) || (from_tower == 2 && to_tower == 3 && !tower3.empty? && tower2[0] > tower3[0]) || (from_tower == 3 && to_tower == 1 && !tower1.empty? && tower3[0] > tower1[0]) || (from_tower == 3 && to_tower == 2 && !tower2.empty? && tower3[0] > tower2[0])
    puts "Sorry, but that move is against the rules because the disk from tower #{from_tower} is larger than the disk from tower #{to_tower}."
  else
    #If it is the correct size to move, then make the move
    if (from_tower == 1) && (to_tower == 2)
      tower2.unshift(tower1.shift)
    elsif (from_tower == 1) && (to_tower == 3)
      tower3.unshift(tower1.shift)
    elsif (from_tower == 2) && (to_tower == 1)
      tower1.unshift(tower2.shift)
    elsif (from_tower == 2) && (to_tower == 3)
      tower3.unshift(tower2.shift)
    elsif (from_tower == 3) && (to_tower == 1)
      tower1.unshift(tower3.shift)
    elsif (from_tower == 3) && (to_tower == 2)
      tower2.unshift(tower3.shift)
    end

  end
  
  #Show current tower setup
  puts
  puts "Your Tower of Hanoi currently looks like this: " + show_towers(tower1, tower2, tower3)
end

puts "Congratulations! You have successfully completed the Tower of Hanoi!"
