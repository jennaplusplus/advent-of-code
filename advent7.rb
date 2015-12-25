VALUES = {}

File.open('advent7.txt', 'r').each do |line|
  instructions = line.chomp.match(/^(.+) -> (\w+)$/)
  value = instructions[1]
  wire = instructions[2]
  VALUES[wire] = value
end

def circuit(wire)
  puts wire
  if wire.match(/^\d+$/)
    return wire.to_i
  end
  if VALUES[wire].match(/^\d+$/)
    return VALUES[wire].to_i
  end
  if matches = VALUES[wire].match(/^(\w+)$/)
    ref = matches[1]
    return circuit(ref)
  elsif matches = VALUES[wire].match(/^NOT (\w+)/)
    not_wire = matches[1]
    VALUES[wire] = complement(circuit(not_wire)).to_s
    return VALUES[wire].to_i
  elsif matches = VALUES[wire].match(/^(\w+) (AND|OR|RSHIFT|LSHIFT) (\w+)/)
    operation = matches[2]
    left = matches[1]
    right = matches[3]

    if operation == "AND"
      VALUES[wire] = combine(circuit(left), circuit(right)).to_s
      return VALUES[wire].to_i
    elsif operation == "OR"
      VALUES[wire] = either(circuit(left), circuit(right)).to_s
      return VALUES[wire].to_i
    elsif operation == "RSHIFT"
      VALUES[wire] = rshift(circuit(left), circuit(right)).to_s
      return VALUES[wire].to_i
    elsif operation == "LSHIFT"
      VALUES[wire] = lshift(circuit(left), circuit(right)).to_s
      return VALUES[wire].to_i
    end
  end
end

def complement(number)
  return ~number % (2 ** 16)
end

def combine(left, right)
  return left & right
end

def either(left, right)
  return left | right
end

def rshift(left, right)
  return left >> right
end

def lshift(left, right)
  return left << right
end

puts circuit("a")
