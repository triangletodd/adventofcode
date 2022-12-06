#!/usr/bin/env ruby
require 'pp'

@data = File.read("input").split('')

@data.each_with_index do |c, i|
  next if i < 3
  seq = @data[i-3..i]
  if seq.uniq.length == 4
    puts i+1
    return
  end
end


