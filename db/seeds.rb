# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
  Snippet.create!(code:
  'puts "Enter two separated values to start with:"
  array = gets.split(/[^0-9]/)
  array.map! { |i| i.to_i }
  puts "Enter the length of necessary consequence:"
  length = gets.to_i

  (length - 2).times do
    array << array[-1] + array[-2]
  end

  puts "Here is the result:"
  print array')
  
  Snippet.create!(code:
  'if c < 255 && switch == 0
    if !(0...15).include?(c)
      z = ""
    end
    c += 1
    if c == 255
      switch = 1
      c = 0
      z = "0"
    end
  elsif b < 255 && switch == 1
    if !(0...15).include?(b)
      y = ""
    end
    b += 1
    if b == 255
      switch = 2
      b = 0
      y = "0"
    end
  elsif a < 255 && switch == 2
    if !(0...15).include?(a)
      x = ""
    end
    a += 1
    if a == 255
      switch = 3
      a = 0
      x = "0"
    end
  end')
end
