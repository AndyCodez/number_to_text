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

class NumberConverter 
  
  def initialize(number:)
    @number = number

    @number_values = %w[zero one two three four five
                        six seven eight nine ten eleven
                        twelve thirteen fourteen fifteen
                        sixteen seventeen eighteen nineteen].map!(&:capitalize)

    @tens = ['', '', 'twenty', 'thirty', 'forty',
             'fifty', 'sixty', 'seventy', 'eighty', 'ninety'].map!(&:capitalize)

    @scale_numbers = ['', 'thousand', 'million', 'billion'].map!(&:capitalize)
  end

  def convert_to_text
    # Zero rule
    return 'Zero' if @number == 0

    num_length = @number.to_s.length

    # Holds the four three-digit groups
    digit_groups = Array.new(4)

    # Ensure positive number to extract from
    # To avoid the negative modulus values
    positive_number = @number.abs

    # Any integer divided by 1000,
    # the remainder is equal to the last three digits of the original number
    # eg. 57%1000 = 57, 987%1000 = 987, 9763%1000 = 763

    # Extract the 4 three-digit groups
    # There can never be more than 4 three-digits groups
    (0...4).each do |i|
      digit_groups[i] = positive_number % 1000
      positive_number /= 1000
    end

    # Convert the three-digit groups to words
    group_text = []
    (0...4).each do |i|
      group_text[i] = three_digit_group_to_words(digit_groups[i])
    end

    # Recombine the three-digit groups
    combined = group_text[0]
    append_and = false

    # Check whether an and is needed
    append_and = (digit_groups[0] > 0) && (digit_groups[0] < 100)

    # Process the remaining groups
    (1...4).each do |i|
      # Only add non-zero digits
      next if digit_groups[i] == 0

      # Create tne string to add as a prefix
      prefix = group_text[i] + ' ' + @scale_numbers[i]
      unless combined.empty?
        prefix += append_and ? ' and ' : ', '
      end

      # Can no longer add " and"
      append_and = false

      # Add the three-digit group to the string
      combined = prefix + combined
    end

    # Negative rule
    combined = 'Negative ' + combined if @number < 0

    combined
  end

  private

  def three_digit_group_to_words(three_digits)
    group_text = ''
    hundreds = three_digits / 100
    tens_units = three_digits % 100

    # Hundreds rules
    if hundreds != 0
      group_text += @number_values[hundreds] + ' Hundred'
      group_text += ' and ' unless tens_units == 0
    end

    tens = tens_units / 10
    units = tens_units % 10

    # Tens rule
    if tens >= 2
      group_text += @tens[tens]
      group_text += ' ' + @number_values[units] unless units == 0
    elsif tens_units != 0
      group_text += @number_values[tens_units]
    end
    group_text
  end
end

puts NumberConverter.new(number: 23).convert_to_text

