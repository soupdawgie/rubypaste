# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

fib = <<-code
puts "Enter two separated values to start with:"
array = gets.split(/[^0-9]/)
array.map! { |i| i.to_i }
puts "Enter the length of necessary consequence:"
length = gets.to_i

(length - 2).times do
  array << array[-1] + array[-2]
end

puts "Here is the result:"
print array
puts ""
code

staircase = <<-code
n = gets.strip.to_i
a = 1
b = n + 1

n.times do
  puts ("#" * a).rjust(b - 1)
  a += 1
end
code

military = <<-code
time = gets.strip
reg = /(\d*):(\d*):(\d*)(\w*)/.match(time)

def converter(a)
  if a[3] == "PM" && a[0] != "12"
      a[0] = (a[0].to_i + 12).to_s
  elsif a[3] == "AM" && a[0] == "12"
      a[0] = "00"
  end
  puts "\#{a[0]}:\#{a[1]}:\#{a[2]}"
end

converter(reg[1..4])
code

military_ruby = <<-code
require 'date'
time = gets.strip
puts DateTime.parse(time).strftime("%H:%M:%S")
code

User.create!(email: "soupdawgie@gmail.com",
             name:  "Vladimir",
             username: "soupdawgie",
             password: "qweqweqwe",
             password_confirmation: "qweqweqwe")

@guest = User.create!(email: "guest@rubypaste.io",
                      name:  "Stranger",
                      username: "guest",
                      password: "guestpassword",
                      password_confirmation: "guestpassword")

@guest.snippets.build(title: "Staircase", code: staircase).save
@guest.snippets.build(code: fib).save
@guest.snippets.build(title: "Military time to 24H", code: military).save
@guest.snippets.build(title: "Military time to 24H: Ruby style", code: military_ruby).save
