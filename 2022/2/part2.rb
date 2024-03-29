#!/usr/bin/env ruby

PLAYS = { 'A' => 1, 'B' => 2, 'C' => 3 }
WINS = { 'A' => 'C', 'B' => 'A', 'C' => 'B' }

input = File.readlines('input', chomp: true)

scores_a = input.sort.uniq.to_h do |key|
  (theirs, ours) = key.split
  ours.tr!('X-Z', 'A-C')

  score = PLAYS[ours]
  if WINS[ours].eql? theirs
    score += 6
  elsif ours.eql? theirs
    score += 3
  end

  [key, score]
end

scores_b = input.sort.uniq.to_h do |key|
  (theirs, outcome) = key.split

  score = case outcome
          when 'X' then 0 + PLAYS[WINS[theirs]]
          when 'Y' then 3 + PLAYS[theirs]
          when 'Z' then 6 + PLAYS[WINS.invert[theirs]]
          end

  [key, score]
end

puts input.sum { |i| scores_b[i] }
