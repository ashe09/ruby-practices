#! /usr/bin/env ruby
require "date"
require "optparse"

# ライブラリDate 本日を取得
today = Date.today

# ライブラリoptparse コマンドラインのオプション
params = ARGV.getopts("m:y:")
input_month = params["m"] ? params["m"] : today.mon
input_year = params["y"] ? params["y"] : today.year
month = input_month.to_i
year = input_year.to_i

# 引数の数値範囲外の場合にエラーメッセージを表示し、処理を終了
unless month.between?(1, 12)
  puts "cal: 13 is neither a month number (1..12) nor a name"
  return
end

unless year.between?(1, 9999)
  puts "cal: year `10000' not in range 1..9999"
  return
end

# 月初めの日・最後の日・月初めの日の曜日を取得
first_day = Date.new(year, month, 1)
last_day = Date.new(year, month, -1)
beginning_of_month = first_day.wday

# カレンダーの月・年・曜日の表示
puts ("#{month}月 #{year}").center(20)
puts "日 月 火 水 木 金 土"

# 月初めの日の曜日まで空白を入れる
i = 0
while i < beginning_of_month
  space = ""
  printf("%3s", space)
  i += 1
end

# 日付を表示
(first_day..last_day).each {|x|
  if x == today
    print "\e[30m\e[47m"
    printf("%2s", x.day.to_s)
    print "\e[0m"
    print " "
  else
    printf("%2s", x.day.to_s)
    print " "
  end
  if x.wday == 6
    print "\n"
  end
}
puts "\n"
