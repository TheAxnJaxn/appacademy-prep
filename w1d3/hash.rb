class MyHashSet
  
  def initialize()  
    @store = {}
  end
  
  def insert(el)
    @store[el] = true
  end
  
  def include?(el)
    @store.has_key?(el) true : false
  end
  
  def delete(el)
    if @store.include?(el)
      @store.delete(el)
      return true
    else
      return false
    end
  end
  
  def to_a
    return @store.keys
  end
  
  def union(set2)
    return @store.merge(set2)
  end
  
  def intersect(set2)
    new_set = {}
    self.each do |key, value|
      if set2.has_key?(key)
        new_set[key] = value
      end
    end
    return new_set
  end
  
  def minus(set2)
    new_set = {}
    self.each do |key, value|
      if set2.has_key?(key) == false
        new_set[key] = value
      end
    end
    return new_set
  end
  
end
