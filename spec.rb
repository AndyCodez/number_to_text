require "minitest/autorun"
require_relative "number_to_text"

describe "Num.new" do
	num = Num.new
	it "should return a number in words" do
		num.number_to_text(0).must_equal "zero".downcase
		num.number_to_text(23).must_equal "Twenty three".downcase
		num.number_to_text(13).must_equal "thirteen".downcase
		num.number_to_text(213).must_equal "two hundred and thirteen".downcase
		num.number_to_text(9003).must_equal "nine thousand and three".downcase
		num.number_to_text(9233).must_equal "nine thousand and two hundred and thirty three".downcase
		num.number_to_text(9000).must_equal "nine thousand".downcase
		num.number_to_text(3).must_equal "three".downcase
		num.number_to_text(50000).must_equal "fifty thousand".downcase
		num.number_to_text(500000).must_equal "five hundred thousand".downcase
		num.number_to_text(2313).must_equal "two thousand and three hundred and thirteen".downcase
	end
end