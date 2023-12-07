NUM_SET = {
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}

def main
  coordinate_sum = 0

  File.foreach('./input.txt') do |line|
    results = parse_line(line)

    coordinate = ''
    coordinate << results.first
    coordinate << results.last

    coordinate_sum += coordinate.to_i
  end

  puts coordinate_sum
end

def parse_line(line)
  numbers_for_line = []
  string_results = ''

  line.each_char do |el|
    if NUM_SET.value?(el)
      numbers_for_line << el
    else
      string_results << el

      NUM_SET.keys.each do |number|
        if string_results.include?(number)
          string_results = number[1..-1]

          numbers_for_line << NUM_SET[number]
        end
      end
    end
  end

  numbers_for_line
end

main
