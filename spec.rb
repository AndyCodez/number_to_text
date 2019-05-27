require "minitest/autorun"
require_relative "number_to_text"

describe "Num.new" do
	num = Num.new
	it "should return a number in words" do
		num.number_to_text(0).must_equal "Zero"
		num.number_to_text(13).must_equal "Thirteen"
		num.number_to_text(23).must_equal "Twenty Three"
		num.number_to_text(5672).must_equal "Five Thousand, Six Hundred and Seventy Two"
		num.number_to_text(45781).must_equal "Forty Five Thousand, Seven Hundred and Eighty One"
		num.number_to_text(50000).must_equal "Fifty Thousand"
		num.number_to_text(-50000).must_equal "Negative Fifty Thousand"
		num.number_to_text(500000).must_equal "Five Hundred Thousand"
	end
end