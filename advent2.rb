total_wrapping = 0
File.open('advent2.txt', 'r').each do |line|
  l, w, h = line.split("x").map! do |item|
    item.to_i
  end
  min_side = [l*w, w*h, *h*l].min
  wrapping = 2*l*w + 2*w*h + 2*h*l + min_side
  total_wrapping += wrapping
end

puts total_wrapping
