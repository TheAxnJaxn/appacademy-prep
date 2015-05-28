class Array

# 0. REMOVE DUPLICATES
  def my_uniq
    new_array = []
    self.each do |object|
      if !new_array.include?(object)
        new_array << object
      end
    end
    return new_array
  end
  
# 1. TWO SUM
  def two_sum
  pairs = []
    self.each do |num|
    idx = self.index(num) + 1
      while idx < self.length
        if (num + self[idx] == 0)
          pair = [self.index(num), idx]
          pairs << pair
        end
        idx += 1
      end
    end
  return pairs
  end

# 2. MY MATRIX TRANSPOSE
  def my_transpose
    transposed = []
    while !self[0].empty?
    temp_array = []
    idx = 0
      while idx < self.length
      temp_array << self[idx].shift
      idx += 1
      end
    transposed << temp_array
    end
    return transposed
  end
  
# 3. STOCK PICKER
  def stock_picker
    idx = 0
    most_profitable = []
    largest_difference = 0
    
    while idx < self.length - 1
    
    idx2 = idx + 1
      while idx2 < self.length
      difference = self[idx2] - self[idx]
        if difference > largest_difference
          largest_difference = difference
          most_profitable = [idx, idx2]
        end
      idx2 += 1
      end
    idx += 1
    end

    return most_profitable
  end
  
end
