require './AntsFixnum.rb' 

test_int = 234
a = false

puts a == true ? test_int.to_words : test_int.to_hex

if a == true then puts test_int.to_words else puts test_int.to_hex end

if a == true
	puts test_int.to_words
else
	puts test_int.to_hex
end

puts test_int.to_words if a == true 
puts test_int.to_hex if a == false

puts test_int.to_text
puts test_int.to_words
puts test_int.to_binary
puts test_int.to_hex