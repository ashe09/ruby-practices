#! /usr/bin/env ruby
# frozen_string_literal: true

input_score = ARGV[0]
scores = input_score.split(',')
shots = []

STRIKE = 'X'
STRIKE_SCORE = 10

scores.each do |score|
  if score == STRIKE
    shots << STRIKE_SCORE
    shots << 0
  else
    shots << score.to_i
  end
end

frames = shots.each_slice(2).to_a
frame_number = 10
point = 0

frame_number.times do |i|
  point += if frames[i][0] == STRIKE_SCORE
             if frames[i + 1][0] == STRIKE_SCORE
               frames[i][0] + frames[i + 1].sum + frames[i + 2][0]
             else
               frames[i][0] + frames[i + 1].sum
             end
           elsif frames[i].sum == STRIKE_SCORE
             frames[i].sum + frames[i + 1][0]
           else
             frames[i].sum
           end
end

puts point
