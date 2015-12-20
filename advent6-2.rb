grid = Array.new(1000) { Array.new(1000,0) }

File.open('advent6.txt', 'r').each do |line|
  matches = line.chomp.match(/(.+?) (\d+),(\d+) through (\d+),(\d+)/)
  x1 = matches[2].to_i
  y1 = matches[3].to_i

  x2 = matches[4].to_i
  y2 = matches[5].to_i

  case matches[1]
  when "turn on"
    (x1..x2).each do |x_coord|
      (y1..y2).each do |y_coord|
        grid[x_coord][y_coord] += 1
      end
    end
  when "turn off"
    (x1..x2).each do |x_coord|
      (y1..y2).each do |y_coord|
        grid[x_coord][y_coord] -= 1 if grid[x_coord][y_coord] >= 1
      end
    end
  when "toggle"
    (x1..x2).each do |x_coord|
      (y1..y2).each do |y_coord|
        grid[x_coord][y_coord] += 2
      end
    end
  end
end

puts grid.flatten.inject{|sum,x| sum + x }
