# "Write a function that given an integer number, it will print out the number in words

# Example:
# input: 1000
# output: One Thousand

# Example 2: 

# Input: 423
# Output: Four Hundred Twenty Three

# Input: 5672:
# Output: Five Thousand Six Hundred Seventy Two

# Input: 45781:
# Ouput: Forty Five Thousand Seven Hundred Eighty One" 

class Num
	def number_to_text(number)
		@@number_values = ["zero", "one", "two", "three", "four", "five", 
						"six", "seven", "eight", "nine",
						"ten" , "eleven","twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

		@@tens = ["", "", "twenty", "thirty", "forty", 
				"fifty", "sixty" , "seventy", "eighty", "ninety"]						
		
		scale_numbers = ["", "Thousand", "Million", "Billion"]
		
		# Zero rule
		return "zero" if number == 0				
		num_length = number.to_s.length

		# Holds the four three-digit groups 
		digit_groups = Array.new(4)

		# Ensure positive number to extract from
		# To avoid the negative modulus values
		positive_number = number.abs

		# Any integer divided by 1000, 
		# the remainder is equal to 
		# the last three digits of the original number 
		# eg. 57%1000 = 57, 987%1000 = 987, 9763%1000 = 763

		# Extract the 4 three-digit groups
		# There can never be more than 4 three-digits groups
		# 1) digit_groups[0] => 9763%1000=763, 
		# 	positive_number => 9763/1000=9 (Ruby rounds down)
		
		# 2) digit_groups[1] => 9%1000=9, 
		# 	positive_number => 9/1000=0 (Ruby rounds down)
		
		# 3) digit_groups[2] => 0%1000=0, 
		# 	positive_number => 0/1000=0 (Ruby rounds down)

		# 4) digit_groups[3] => 0%1000=0, 
		# 	positive_number => 0/1000=0 (Ruby rounds down)	

		# digit_groups = [763, 9, 0, 0]
		for i in 0...4 do
			digit_groups[i] = positive_number%1000
			positive_number /=1000
		end

		# Convert the three-digit groups to words
		group_text = []
		for i in 0...4 do
			group_text[i] = three_digit_group_to_words(digit_groups[i])
		end

		# Recombine the three-digit groups
		combined = group_text[0]
		append_and = false

		# Check whether an and is needed
		append_and = (digit_groups[0] > 0) && (digit_groups[0] < 100)

		# Process the remaining groups
		for i in 1...4 do
			# Only add non-zero digits
			if digit_groups[i] != 0
				# Create tne string to add as a prefix
				prefix = group_text[i] + " " + scale_numbers[i]
				if combined.length != 0
					prefix += append_and ? " and " : ", "
				end

				# Can no longer add " and"
				append_and = false

				# Add the three-digit group to the string
				combined = prefix + combined 
			end
		end

		# Negative rule
		if number < 0
			combined = "Negative " + combined
		end
		return combined
	end

	private
		def three_digit_group_to_words(three_digits)
			group_text = ""
			hundreds = three_digits/100
			tens_units = three_digits%100

			# Hundreds rules
			if hundreds != 0 
				group_text += @@number_values[hundreds] + " Hundred"
				if tens_units != 0 
					group_text += " and "
				end
			end

			tens = tens_units/10
			units = tens_units%10

			# Tens rule
			if tens >= 2
				group_text += @@tens[tens]
				if units != 0
					group_text += " " + @@number_values[units]
				end
			elsif tens_units != 0 
					group_text += @@number_values[tens_units]
			end
			return group_text
		end	
end

puts Num.new.number_to_text(150)

