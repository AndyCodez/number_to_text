require 'minitest/autorun'
require_relative 'number_to_text'

describe NumberConverter do
  describe '#number_to_text' do
    it 'should return the number in words' do
      NumberConverter.new(number: 0).convert_to_text.must_equal 'Zero'
      NumberConverter.new(number: 13).convert_to_text.must_equal 'Thirteen'
      NumberConverter.new(number: 23).convert_to_text.must_equal 'Twenty Three'
      NumberConverter.new(number: 5672).convert_to_text.must_equal 'Five Thousand, Six Hundred and Seventy Two'
      NumberConverter.new(number: 45_781).convert_to_text.must_equal 'Forty Five Thousand, Seven Hundred and Eighty One'
      NumberConverter.new(number: 50_000).convert_to_text.must_equal 'Fifty Thousand'
      NumberConverter.new(number: -50_000).convert_to_text.must_equal 'Negative Fifty Thousand'
      NumberConverter.new(number: 1_000_000).convert_to_text.must_equal 'One Million'
    end
  end
end
