require 'digest'

str = "1"
until Digest::MD5.hexdigest("iwrupvqb" + str)[0..4] == "00000"
  str = str.succ
end

puts str
