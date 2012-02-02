

string = 'the cat sat on the mat'

def spin(string = '')
	cat = ['cat','feeline','kitty','pussy']
	mat = ['mat','rug']
	sat = ['sat']
	words = []
	string.split(/ /).each do |word|
		words << word
	end

	words.each do |word|
		if word[0] == 'c'
			puts word = cat.sample(1)
		end
	end
end
spin string