# The exponent operator in ruby is **

def add(operand_1, operand_2)
  return operand_1 + operand_2
end

def subtract(operand_1, operand_2)
  return operand_1 - operand_2
end

def multiply(operand_1, operand_2)
  return operand_1 * operand_2
end

def divide(operand_1, operand_2)
  return operand_1 / operand_2
end

def exponent(operand_1, operand_2)
  return operand_1 ** operand_2
end

def root(operand_1)
  return Math.sqrt(operand_1)
end

# ask the user what kind of math operation he wants to do
# (add, subtract, multiply, divide)
puts "Give me an operation!"
operator = gets.chomp

# ask the user what numbers to operate on and convert the
# user input to integers
puts "Give me a number!"
operand_1 = gets.chomp.to_i

puts "Give me another number! Unless you want the square root, in which case press RETURN"
operand_2 = gets.chomp.to_i

print "#{operand_1} #{operator} #{operand_2} == "

case operator
when "+"
  result = add(operand_1, operand_2)
when "-"
  result = subtract(operand_1, operand_2)
when "*"
  result = multiply(operand_1, operand_2)
when "/"
  result = divide(operand_1, operand_2)
when "^"
  result = exponent(operand_1, operand_2)
when "sqrt"
  result = root(operand_1)
else
  puts "I have no idea what you intended to do here."
end

print result
