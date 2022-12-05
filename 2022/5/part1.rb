#!/usr/bin/env ruby
@data = File.open("input").readlines.map(&:chomp)
@crate_input = []
@move_input = []
@crates = []

def parse_input()
  @data.each_with_index do |line, index|
    next unless line == ""
    @crate_input = @data[0..index-2]
    @move_input = @data[index+1..]
    break
  end
end

def parse_crates(cinput, cindex=1)
  cinput.each_with_index do |line, index|
    next if line.nil?
    container = line[0..2].tr('[]', '').strip
    cinput[index] = line[4..]
    @crates[cindex] ||= []
    @crates[cindex].push(container) unless container == ""
  end

  if cinput.last.nil?
    return @crates
  else
    parse_crates(cinput, cindex+1)
  end
end

def move_crates(move_input)
  move_input.each do |input|
    raw = input.split(' ')
    count = raw[1].to_i
    from = raw[3].to_i
    to = raw[5].to_i

    count.times do
      @crates[to].unshift @crates[from].shift
    end
  end
end

parse_input()
parse_crates(@crate_input, 1)
move_crates(@move_input)

puts @crates.compact.map { |c| c.first }.join('')
