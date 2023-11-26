#! /usr/bin/env ruby
# frozen_string_literal: true

input_score = ARGV[0]
scores = input_score.split(',')
shots = []
scores.each do |score|
  if score == 'X'
    shots << 10
    shots << 0
  else
    shots << score.to_i
  end
end

frames = shots.each_slice(2).to_a
point = 0
10.times do |i|
  point += if frames[i][0] == 10
             frames[i + 1].sum + frames[i + 2][0]
           elsif frames[i].sum == 10
             frames[i + 1][0]
           else
             frames[i].sum
           end
end

puts point
