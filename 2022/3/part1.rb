#!/usr/bin/env ruby

priority = [*'a'..'z', *'A'..'Z'].zip(1..52)
                                 .to_h

input = File.readlines('input', chomp: true)
            .map(&:chars)

puts input.sum { |i| priority[i.each_slice(i.size / 2).reduce(:&).first] }
