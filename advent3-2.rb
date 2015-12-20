require 'set'

file = File.open("advent3.txt", 'r')
directions = file.read

s = Set.new
s.add([0,0])
santa = [0,0]
robot = [0,0]

directions.each_char.with_index do |dir, i|
  if dir == "^" && i % 2 == 0
    santa[1] += 1
  elsif dir == "^" && i % 2 != 0
    robot[1] += 1
  elsif dir == "v" && i % 2 == 0
    santa[1] += -1
  elsif dir == "v" && i % 2 != 0
    robot[1] += -1
  elsif dir == ">" && i % 2 == 0
    santa[0] += 1
  elsif dir == ">" && i % 2 != 0
    robot[0] += 1
  elsif dir == "<" && i % 2 == 0
    santa[0] += -1
  elsif dir == "<" && i % 2 != 0
    robot[0] += -1
  end
  s.add(santa.dup)
  s.add(robot.dup)
end

puts s.count
