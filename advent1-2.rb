file = File.open('advent1.txt', 'r')
input = file.read

floor = 0
position = 0
input.each_char do |char|
  if floor != -1
    floor += 1 if char == "("
    floor += -1 if char == ")"
    position += 1
  else
    break
  end
end

puts position
