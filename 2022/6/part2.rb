#!/usr/bin/env ruby
require 'pp'

@data = File.read("input").split('')

@data.each_with_index do |c, i|
  next if i < 13
  seq = @data[i-13..i]
  if seq.uniq.length == 14
    puts i+1
    return
  end
end


