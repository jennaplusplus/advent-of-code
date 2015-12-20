require 'digest'

str = "1"
until Digest::MD5.hexdigest("iwrupvqb" + str)[0..5] == "000000"
  str = str.succ
end

puts str
