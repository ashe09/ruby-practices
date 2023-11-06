#! /usr/bin/env ruby
(1..20).each {|x|
  case
  when x % 15 == 0
    puts "FizzBuzz"
  when x % 5 == 0
    puts "Buzz"
  when x % 3 == 0
    puts "Fizz"
  else
    puts x
  end
}
