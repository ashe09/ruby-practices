#! /usr/bin/env ruby
require "date"
require "optparse"

today = Date.today
params = ARGV.getopts("m:y:")
month = params["m"] ? params["m"].to_i : today.mon
year = params["y"] ? params["y"].to_i : today.year

unless month.between?(1, 12)
  puts "cal: 13 is neither a month number (1..12) nor a name"
  return
end

unless year.between?(1, 9999)
  puts "cal: year `10000' not in range 1..9999"
  return
end

first_day = Date.new(year, month, 1)
last_day = Date.new(year, month, -1)
beginning_of_month = first_day.wday

puts ("#{month}月 #{year}").center(20)
puts "日 月 火 水 木 金 土"

space = format("%3s", "")
print space * beginning_of_month

(first_day..last_day).each do |day|
  if day == today
    print "\e[30m\e[47m"
    printf("%2s", day.day.to_s)
    print "\e[0m"
    print " "
  else
    printf("%2s", day.day.to_s)
    print " "
  end
  if day.saturday?
    print "\n"
  end
end
puts "\n"
