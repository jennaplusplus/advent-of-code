file = File.open('advent1.txt', 'r')
input = file.read

start = 0
input.each_char do |char|
  start += 1 if char == "("
  start += -1 if char == ")"
end

puts start
