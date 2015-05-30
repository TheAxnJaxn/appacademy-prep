def ftoc(fahrenheit)  # Method that converts F to C
  fahrenheit = fahrenheit.to_f
  (fahrenheit - 32) * 5/9
end

def ctof(celsius)     # Method that converts C to F
  celsius = celsius.to_f
  celsius * 9/5 + 32
end