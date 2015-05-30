def add(num1, num2)
  return num1 + num2
end

def subtract(num1, num2)
  return num1 - num2
end

def sum(array)
  if array.empty? then return 0 end
  return array.inject(:+)
end