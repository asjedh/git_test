# this is a test for git

puts "What is the price of the first item?"
price = gets.chomp
price_arr = []

#a method to calculate a sum of an array with numbers
def sum(floats_array)
  total = 0
  for float in floats_array do
    total += float
  end
  total
end

#keep asking for prices until done is typed in
while price.downcase != "done"
  price_arr << price.to_f
  total_value = sum(price_arr)
  puts
  # use format command in string interpolation to convert to dollars
  # puts the subtotal and get input again
  puts "Subtotal: #{format("$%.2f",total_value)}"
  puts
  puts "What is the price of the next item? Type 'done' if there are no more items."
  price = gets.chomp
end

#output individual and total prices
puts
puts "Here are your item prices:"
puts
for price in price_arr do
  puts format("$%.2f",price)
end
puts
puts "The total amount due is #{format("$%.2f",total_value)}."

#ask for amount tendered
puts
puts "What is the amount tendered?"
tendered = gets.chomp.to_f

difference = (total_value - tendered).abs
#see if tendered amount is less or more than due amount, act accordingly
if tendered < total_value
  puts
  puts "WARNING: Customer still owes #{format("$%.2f",difference)}! Exiting..."
  exit
else
  puts
  puts "===Thank You!==="
  puts "The total change due is #{format("$%.2f",difference)}."
  puts
  puts Time.now.strftime("%m/%d/%Y %l:%M%p")
  puts "================"
end
