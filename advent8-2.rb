increase = 0

File.open('advent8.txt', 'r').each do |line|
  length = line.chomp.length
  encoded_length = length

  if line.match(/(\\)/)
    slashes = line.scan(/(\\)/).length
  else
    slashes = 0
  end

  if line.match(/(\")/)
    quotes = line.scan(/(\")/).length
  else
    quotes = 0
  end

  encoded_length += slashes + quotes + 2
  increase += (encoded_length - length)
end

puts increase
