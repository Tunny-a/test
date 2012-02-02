def auto_spin(string = '')
	# could make a db with all dictionary and synonyms to use as lookup 
	cat = ['cat','feeline','kitty','pussy', 'tomcat']
	curled = ['curled','balled','rolled','cuddled']
	mat = ['mat','rug','matting','floor cover']
	sat = ['sat','had a seat','took a load off', 'sat down','rested']
	eating = ['eating', 'feeding on', 'munching', 'chewing', 'enjoying', 'chowing down on']
	dinner = ['dinner', 'food', 'supper', 'a meal']

	# split into words
	words = []
	string.split(/ /).each do |word|
		words << word
	end

	# search each word a letter at a time to find a match in arrays then replace the word with a random synonym
	words.each do |word|
		if word[0] == 'c' then if word[1] == 'a' then string.sub!(word, cat.sample(1)[0]) else string.sub!(word, curled.sample(1)[0]) end end
		if word[0] == 'm' then string.sub!(word, mat.sample(1)[0]) end
		if word[0] == 's' then string.sub!(word, sat.sample(1)[0]) end
		if word[0] == 'e' then string.sub!(word, eating.sample(1)[0]) end
		if word[0] == 'd' then string.sub!(word, dinner.sample(1)[0]) end
	end

	# return the spun string
	return string
end

puts '',string = 'the cat sat on the mat and curled up before eating dinner',''
puts auto_spin string

# to do
	# add more words
	# exclude common words like and a the in on etc
	# change if for more complex search method
	# make a manual version? eg the cat|feeline|dog sat on the mat|floor|roof 