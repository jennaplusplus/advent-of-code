class String
  def pair_twice_without_overlap?
    !self.match(/([a-z][a-z]).*\1/).nil?
  end

  def repeat_with_intervening_letter?
    !self.match(/([a-z])[a-z]\1/).nil?
  end

  def nice_now?
    pair_twice_without_overlap? && repeat_with_intervening_letter?
  end
end

nice_count = 0
File.open('advent5.txt', 'r').each do |line|
  if line.chomp.nice_now?
    nice_count += 1
  end
end

puts nice_count
