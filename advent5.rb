class String
  def three_vowels?
    !(self.match(/[aeiou].*[aeiou].*[aeiou]/)).nil?
  end

  def double_letter?
    !(self.match(/([a-z])\1/)).nil?
  end

  def forbidden?
    self.include?("ab") || self.include?("cd") || self.include?("pq") || self.include?("xy")
  end

  def nice?
    three_vowels? && double_letter? && !forbidden?
  end
end

nice_count = 0
File.open('advent5.txt', 'r').each do |line|
  if line.chomp.nice?
    nice_count += 1
  end
end

puts nice_count
