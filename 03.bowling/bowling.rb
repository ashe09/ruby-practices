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

frames = []
shots.each_slice(2) do |score|
  frames << score
end

point = 0
10.times do |i|
  point += if frames[i][0] == 10
             if frames[i + 1][0] == 10
               10 + frames[i + 1].sum + frames[i + 2][0]
             else
               10 + frames[i + 1].sum
             end
           elsif frames[i].sum == 10
             10 + frames[i + 1][0]
           else
             frames[i].sum
           end
end

puts point
