string_count = 0
code_count = 0

File.open('advent8.txt', 'r').each do |line|
  line = line.chomp[1..-2]

  if line.match(/(\\\\)/)
    slashes = line.scan(/(\\\\)/).length
    line.gsub!("\\\\", "??")
  else
    slashes = 0
  end

  if line.match(/(\\x)/)
    hexes = line.scan(/(\\x)/).length
    line.gsub!("\\x", "**")
  else
    hexes = 0
  end

  if line.match(/(\\")/)
    quotes = line.scan(/(\\")/).length
    line.gsub!("\\\"", "!!")
  else
    quotes = 0
  end

  string_count += line.length - (3 * hexes) - quotes - slashes
  code_count += line.inspect.length
end

puts "#{code_count} - #{string_count} = #{code_count - string_count}"
