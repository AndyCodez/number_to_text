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
		return "zero" if number == 0				
		num_length = number.to_s.length

		number_values = {1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 
						6 => "six", 7 => "seven", 8 => "eight", 9 => "nine",
						10 => "ten" , 11 => "eleven", 12 => "twelve", 13 => "thirteen",
						14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen",
						18 => "eighteen", 19 => "nineteen"}

		tens = { 20 => "twenty", 30 => "thirty", 40 => "forty", 
						50 => "fifty", 60 => "sixty" ,70 => "seventy",80 => "eighty",90 => "ninety"}

		return number_values[number] if num_length == 1 

		rest_of_digits = number.to_s[1..num_length - 1].to_i

		first_number = number.to_s[0].to_i
		tenths_number = number.to_s[num_length - 2].to_i
		last_number = number.to_s[num_length - 1].to_i

		case num_length
		when 2
			return number_values[number] if number < 20
			if last_number == 0
				return tens[first_number * 10]
			else	
				return tens[first_number * 10] + " " + number_values[last_number.to_i]
			end		
		when 3
			if tenths_number > 1
				return number_values[first_number] + " hundred and " + tens[tenths_number * 10] + " " + number_values[last_number.to_i]
			else
				if last_number == 0
					return number_values[first_number] + " hundred"
				else
					return number_values[first_number] + " hundred and " + number_to_text(rest_of_digits).to_s
				end
			end		
		when 4
			if last_number == 0
				return number_values[first_number] + " thousand"
			else
				return number_values[first_number] + " thousand and " + number_to_text(rest_of_digits).to_s
			end		
		when 5
			return tens[first_number * 10] + " thousand"
		when 6
			if last_number == 0
				return number_values[first_number] + " hundred thousand"
			else
				return number_values[first_number] + " hundred and " + number_to_text(rest_of_digits).to_s
			end		
		else
			return "Not supported."
		end
	end
end

puts Num.new.number_to_text(1000)

