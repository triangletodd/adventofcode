#!/usr/bin/env ruby
input = File.read('input').scan(/\d+/)

out = input.each_slice(2).map { |i| Array(Range.new(*i)) }.each_slice(2)

puts out.reject { |i| i.reduce(:&).empty? }.count

