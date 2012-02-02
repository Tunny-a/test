module AntsFixnum
	def to_text(int = self)
		return 'zero' if int == 0
		numbers = [''] << %w( one two three four five six seven eight nine)
		numbers.flatten!
		teens = %w(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
		tens = %w(zero ten twenty thirty fourty fifty sixty seventy eighty ninety)
		suffixes = ['', '', 'hundred and','thousand','million','billion','trillion','quadrillion','quintillion','sexillion','septillion','octillion','nonillion','decillion','undecillion','duodecillion','tredecillion','quattuordecillion','quindecillion','sexdecillion','septdecillion','octodecillion','novemdecillion','vigintillion','unvigintillion','duovigintillion','trevigintillion','quattuorvigintillion','quinvigintillion','sexvigintillion','septvigintillion','octovigintillion','novemvigintillion','trigintillion','untrigintillion','duotrigintillion','tretrigintillion','quattuortrigintillion','quintrigintillion']
		i = 0
		string = []
		add_and = false
		int.to_s.reverse.scan(/\d{,3}/).each do |num|
			temp_string = []
			if i > 0 
				if num[0..2].to_i != 0
					if i == 1 and add_and == true 
						temp_string << 'and' 
					end	
					temp_string << suffixes[i+2]
				else 
					temp_string << 'and'
				end
			else
				if num[2].to_i == 0
					add_and = true
				end
			end
			temp_string << numbers[num[0].to_i] if num[0] != nil and num[0].to_i != 0
			if num[1].to_i == 1
				if i == 0 
					temp_string[0] = teens[num[0].to_i] 
				else
					if i == 1 and add_and == true
						temp_string[2] = teens[num[0].to_i] 
					else
						temp_string[1] = teens[num[0].to_i] 
					end				
				end 
			else
				temp_string << tens[num[1].to_i] if num[1].to_i != 0
			end if num[1] != nil
			temp_string << numbers[num[2].to_i] + ' ' + suffixes[2] if num[2] != nil and num[2].to_i != 0
			string << temp_string.reverse
			i += 1
		end
		string.delete_at(-1)
		string.reverse.join(' ').sub(/and\s*$/,'')
	end

	def to_words(int = self)
		text = []
		numbers = %w(zero one two three four five six seven eight nine)
		int.to_s.scan(/\d/).each do |num|
			text << "#{numbers[num.to_i]}"
		end
		text.join(' ')
	end

	def to_binary(int = self, debug = 0) # run in debug to figure uncommented section
		binary, bits, next_lowest = [], [], 0
		return 0 if int == 0 # eliminates the exception the code cant handle
		until int == 0 do  # sorts the number into its binary componants (bits)
			bin = 2 
			bin = bin * 2 until bin > int # finds smallest bit bigger than the int
			bin = bin / 2 # get highest bit in the int 
			bits << bin 
			int = int - bin	# changes int to the ramainder after removing the highest bit
		end
		highest_binary_value = bits.first
		until highest_binary_value == 0
			puts 'bits.to_s',bits.to_s,'highest_binary_value',highest_binary_value,'next_lowest',bits[next_lowest] if debug == 1
			if highest_binary_value == bits[next_lowest] and next_lowest < bits.length
				binary << 1
				next_lowest += 1; puts 'output = 1' if debug ==1
			else
				binary << 0; puts 'output = 0' if debug ==1
			end
			highest_binary_value = highest_binary_value / 2; puts '------------------------' if debug ==1
		end
		binary.join('')
	end

	def to_hex(int = self)
		output = []
		binary = to_binary(int)
		hexes = %w(0 1 2 3 4 5 6 7 8 9 A B C D E F)
		binary.to_s.reverse.scan(/\d{,4}/).each do |num|
			hex_amounts, value_of_num, value = [], 0, 1
			num << '0' until num.length > 3
			num.scan(/\d/).each.each {|bin|	value_of_num += bin.to_i * value; value = value * 2}
			hex_amounts << value_of_num
			hex_amounts.each {|hex| output << hexes[hex]}
		end
		output.join('').reverse.sub(/^0+/,'')
	end

	def to_memory_words
		# oh ye! ;)
	end
end

class Fixnum
	include AntsFixnum
end

# test_int = 15909
# puts '','--------------------------------------------------------------------------'
# puts "test_int = #{test_int}"
# puts '--------------------------------------------------------------------------'
# puts 'to_text:',to_text(test_int),''
# puts '--------------------------------------------------------------------------'
# puts 'to_words:',to_words(test_int),''
# puts '--------------------------------------------------------------------------'
# puts 'to_binary:',to_binary(test_int),''
# puts '--------------------------------------------------------------------------'
# puts 'to_hex:',to_hex(test_int),''
# puts '--------------------------------------------------------------------------'

# to_text_2 todo: <--------------------------------	Passed!!
# refactor
# write some respec testing for this!

# to_words todo: <---------------------------------	Passed!!
# write some respec testing for this!

# to_binary_v3 todo: <-----------------------------	Passed!!
# refactor
# write some respec testing for this!

# to_hex todo: <-----------------------------------	Passed!!
# write some respec testing for this!






# Not started
	# to_memory_words todo:
	# 	everything









# Old versions
	# def to_text_1(int)
	# 	numbers = [''] << %w( one two three four five six seven eight nine)
	# 	numbers.flatten!
	# 	teens = %w(zero eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
	# 	tens = %w(zero ten twenty thirty fourty fifty sixty seventy eighty ninety)
	# 	suffixes = %w(hundred thousand million billion trillion)
	# 	if int.to_s.length > 1
	# 		case int.to_s.length
	# 			when 2 then string = tens[int.to_s[0].to_i] + ' ' + numbers[int.to_s[1].to_i]
	# 			when 3 then string = numbers[int.to_s[0].to_i] + ' ' + suffixes[0] + ' and ' + tens[int.to_s[1].to_i] + ' ' + numbers[int.to_s[2].to_i]
	# 		else string = 'int too high'
	# 		end 
	# 		if int.to_s.reverse[1].to_i == 1
	# 			string = string.split(' ').reverse
	# 			string.shift(2)
	# 			string = (string.reverse << teens[int.to_s.reverse[0].to_i]).join(' ')
	# 		else string = string
	# 		end
	# 	else
	# 		if int > 0 then string = numbers[int.to_s[0].to_i] 
	# 		else string = 'zero'
	# 		end
	# 	end
	# end
	#
	# def to_binary_1(int)
	# 	bits=[]
	# 	until int == 0 do # untill the int == 0
	# 		bin = 2 # set up the binary loop
	# 		bin = bin * 2 until bin > int # look for highest bit in int
	# 		bin = bin / 2 # by doubling till over int then halfing
	# 		bits << bin # add that bit to the array
	# 		int = int - bin	# set the int to the remaing number
	# 	end # results in bits arrays like [64, 8, 2, 1] 75 or [64] for 64
	# 	# fixes error cause by entering a binary multiple n = n * 2
	# 	if bits.length == 1 # 512, 1024, 8 etc all come in as a lone bit
	# 		the_one = bits.last # get the bit
	# 		until the_one == 0 # until it = 0
	# 			the_one = the_one / 2 # half it and 
	# 			bits << 0 unless the_one == 0 # add a 0 to the bits array
	# 		end # result in bits arrays like [8, 0, 0, 0]
	# 	end  # a 0 for each bit missed off 1 2 4 8 
	# 	binary = []
	# 	previous_bit = highest_binary_value # so until wont run first time
	# 	bits.each do |bit| # for each bit in array
	# 		until previous_bit == bit do # untill the bit = the previous_bit
	# 			previous_bit = previous_bit / 2 # halve previous_bit
	# 			binary << 0 unless previous_bit == bit # add 0 to binary
	# 		end
	# 		binary << 1 unless bit == 0 
	# 		previous_bit = bit
	# 	end
	# 	binary.join
	# end
	#
	# def to_binary_v2(int)
	# 	bits=[]
	# 	until int == 0 do # untill the int == 0
	# 		bin = 2 # set up the binary loop
	# 		bin = bin * 2 until bin > int # look for highest bit in int
	# 		bin = bin / 2 # by doubling till over int then halfing
	# 		bits << bin # add that bit to the array
	# 		int = int - bin	# set the int to the remaing number
	# 	end # results in bits arrays like [64, 8, 2, 1] 75 or [64] for 64
	# 	binary = []
	# 	(0...bits.length).each do |num|	
	# 		puts num
	# 		binary << 1
	# 		until bits[num] == bits[num+1]# until this bit == next bit /2 and add 0 to binary
	# 			bits[num] = bits[num] / 2 
	# 			binary << 0 unless bits[num] == bits[num+1]
	# 		end if bits[num] != bits.last
	# 		if bits[num] == bits.last 
	# 			until bits[num] < 1
	# 				bits[num] = bits[num] / 2 
	# 				binary << 0 unless bits[num] < 1 or bits[num] != bits.last
	# 			end
	# 		end
	# 	end
	# 	binary.join
	# end