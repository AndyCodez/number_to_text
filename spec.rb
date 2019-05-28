require 'minitest/autorun'
require_relative 'number_to_text'

describe NumberConverter do
  describe '#number_to_text' do
    it 'should return a number in words' do
      num = NumberConverter.new
      num.convert_to_text(0).must_equal 'Zero'
      num.convert_to_text(13).must_equal 'Thirteen'
      num.convert_to_text(23).must_equal 'Twenty Three'
      num.convert_to_text(5672).must_equal 'Five Thousand, Six Hundred and Seventy Two'
      num.convert_to_text(45781).must_equal 'Forty Five Thousand, Seven Hundred and Eighty One'
      num.convert_to_text(50000).must_equal 'Fifty Thousand'
      num.convert_to_text(-50000).must_equal 'Negative Fifty Thousand'
      num.convert_to_text(500000).must_equal 'Five Hundred Thousand'
    end
  end
end
