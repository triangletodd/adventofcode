#!/usr/bin/env ruby

data = File.read("input").split(/\n{2,}/).map { |d| d.split(/\n/) }
data = data.map { |d| d.map { |i| i.to_i }}
data = data.map { |d| d.inject(&:+) }
pp data.sort[data.length-3..].inject(&:+)

