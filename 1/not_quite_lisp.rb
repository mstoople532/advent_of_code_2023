def main
  input = File.read('./input.txt')
  increment = input.scan('(').size
  decrement = input.scan(')').size

  puts "#{increment - decrement}"
end

main
