#! /usr/bin/env ruby
require "date"
require "optparse"

today = Date.today
params = ARGV.getopts("m:y:")
month = params["m"] ? params["m"].to_i : today.mon
year = params["y"] ? params["y"].to_i : today.year

unless month.between?(1, 12)
  puts "cal: #{params["m"]} is neither a month number (1..12) nor a name"
  return
end

unless year.between?(1, 9999)
  puts "cal: year `#{params["y"]}' not in range 1..9999"
  return
end

first_date = Date.new(year, month, 1)
last_date = Date.new(year, month, -1)
first_wday = first_date.wday

puts ("#{month}月 #{year}").center(20)
puts "日 月 火 水 木 金 土"

print "   " * first_wday

(first_date..last_date).each do |date|
  if date == today
    print "\e[30m\e[47m"
    printf("%2s", date.day)
    print "\e[0m"
  else
    printf("%2s", date.day)
  end
  if date.saturday?
    print "\n"
  else
    print " "
  end
end
puts "\n"
