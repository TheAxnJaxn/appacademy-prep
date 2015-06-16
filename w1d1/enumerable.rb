def double(array)
  array.map { |num| num * 2 }
end

class Array
  
  def my_each
    
    idx = 0
    while idx < self.length
      yield self[idx]
      idx += 1
    end
    
    return self
    
  end
  
  def my_each2(&code_block)
    self.count.times { |obj| code_block.call(obj) }
    return self
  end
  
  def my_each3
    self.count.times { |obj| yield obj }
    return self
  end

end

def median(array)

  array = array.sort

  if array.count.even?
    idx1 = (array.count/2 - 1)
    idx2 = (array.count/2)
    return ((array[idx1].to_f + array[idx2].to_f)/2)
  else
    idx = (array.count/2)
    return array[idx]
  end

end

def all_together(array)
  array.inject(:+)
end
