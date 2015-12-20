require 'set'

file = File.open("advent3.txt", 'r')
directions = file.read

s = Set.new
s.add([0,0])

current_point = [0,0]
directions.each_char do |dir|
  case dir
  when "^"
    current_point[1] += 1
  when "v"
    current_point[1] += -1
  when ">"
    current_point[0] += 1
  when "<"
    current_point[0] += -1
  end
  s.add(current_point.dup)
end

puts s.count
