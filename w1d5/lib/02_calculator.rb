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

def multiply(*nums)
  return nums.inject(1) {|product, n| product * n}
end

def power(num1, num2)
  return num1 ** num2
end

def factorial(num)
  if num == 1 || num == 0
    return 1
  else
    return num * factorial(num - 1)
  end
end
