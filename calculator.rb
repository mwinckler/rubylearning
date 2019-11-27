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

# We need to welcome our clientele with a welcoming welcome message, making them feel welcomed
puts "Hello! Welcome to our wondrous calculator!"

# ask the user what kind of math operation he wants to do
# (add, subtract, multiply, divide)
puts "Give me an operation!"
operator = gets.chomp

# ask the user what numbers to operate on and convert the
# user input to integers
puts "Give me a number!"
operand_1 = gets.chomp.to_i

puts "Give me another number!"
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
when "**"
  result = operand_1 ** operand_2
else
  puts "I have no idea what you intended to do here."
end

puts result