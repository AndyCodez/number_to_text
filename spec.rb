require "minitest/autorun"
require_relative "number_to_text"

describe "Number to text" do
	it "should return a number in words" do
		number_to_text(23).must_equal "Twenty three".downcase
		number_to_text(213).must_equal "two hundred and thirteen".downcase
		number_to_text(9003).must_equal "nine thousand and three".downcase
		number_to_text(9000).must_equal "nine thousand".downcase
		number_to_text(3).must_equal "three".downcase
		number_to_text(50000).must_equal "fifty thousand".downcase
		number_to_text(2313).must_equal "two thousand and three hundred and thirteen".downcase
		# number_to_text(10000000).must_equal "ten million".downcase
	end
end