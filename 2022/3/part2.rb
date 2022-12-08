#!/usr/bin/env ruby

priority = [*'a'..'z', *'A'..'Z'].zip(1..52)
                                 .to_h

input = File.readlines('input', chomp: true).map(&:chars)

puts input.each_slice(3).sum { |i| priority[i.reduce(:&).first] }
