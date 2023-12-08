Game = Struct.new(:id, :max_red_count, :max_blue_count, :max_green_count)
CubeSet = Struct.new(:red_total, :blue_total, :green_total, keyword_init: true)

CUBE_SET = CubeSet.new(
  red_total: 12,
  blue_total: 14,
  green_total: 13
)

def main
  game_id_sum = 0
  game_power_sum = 0

  File.foreach('./input.txt') do |line|
    game = assign_game_attributes(line, Game.new)
    if possible_game_with_set?(game)
      game_id_sum += game.id
    end

    game_power_sum += game.max_red_count * game.max_blue_count * game.max_green_count
  end

  puts "game_id_sum: #{game_id_sum}, game_power_sum: #{game_power_sum}"
end

def assign_game_attributes(line, game)
  line = line.split(':')
  game.id = line.first.delete!('Game ').to_i
  game.max_red_count = line.last.scan(/(\d*) red/).flatten.map(&:to_i).max
  game.max_blue_count = line.last.scan(/(\d*) blue/).flatten.map(&:to_i).max
  game.max_green_count = line.last.scan(/(\d*) green/).flatten.map(&:to_i).max
  game
end

def possible_game_with_set?(game)
  return false if CUBE_SET.red_total < game.max_red_count
  return false if CUBE_SET.blue_total < game.max_blue_count
  return false if CUBE_SET.green_total < game.max_green_count

  true
end

main
