total_length = 0
File.open('advent2.txt', 'r').each do |line|
  l, w, h = line.split("x").map! do |item|
    item.to_i
  end
  min_perimeter = [2*l+2*w, 2*w+2*h, 2*h+2*l].min
  bow = l * w * h
  total_length += min_perimeter + bow
end

puts total_length
