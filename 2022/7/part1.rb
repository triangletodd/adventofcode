#!/usr/bin/env ruby
require 'pp'

sizes = Hash.new(0)
input = File.open("input").readlines(chomp: true).map(&:split)

input.each_with_object([]) do |line, tree|
  case line
  in ['$', 'cd', '..']
    tree.pop
  in ['$', 'cd', folder]
    tree.push folder
  in [size, file] if size.match?(/^\d+$/)
    tree.reduce('') { |j, i| sizes[j += i] += size.to_i; j }
  else
    # unhandled
  end
end

puts sizes.values.reject { |size| size > 100_000 }.sum
