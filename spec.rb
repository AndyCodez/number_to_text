require 'minitest/autorun'
require_relative 'number_to_text'

describe NumberConverter do
  describe '#number_to_text' do
    it 'should return the number in words' do
      NumberConverter.new(0).convert_to_text.must_equal 'Zero'
      NumberConverter.new(13).convert_to_text.must_equal 'Thirteen'
      NumberConverter.new(23).convert_to_text.must_equal 'Twenty Three'
      NumberConverter.new(5672).convert_to_text.must_equal 'Five Thousand, Six Hundred and Seventy Two'
      NumberConverter.new(45781).convert_to_text.must_equal 'Forty Five Thousand, Seven Hundred and Eighty One'
      NumberConverter.new(50000).convert_to_text.must_equal 'Fifty Thousand'
      NumberConverter.new(-50000).convert_to_text.must_equal 'Negative Fifty Thousand'
      NumberConverter.new(1000000).convert_to_text.must_equal 'One Million'
    end
  end
end
