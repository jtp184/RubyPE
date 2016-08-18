#!/usr/bin/env ruby

def sum_of_square(range)
	
	result = 0

	for i in range
		result += i ** 2
	end

	return result

end

def square_of_sum(range)
	result = 0

	for i in range
		result += i
	end

	return result ** 2
end

sum_sq = sum_of_square 0..100
sq_sum = square_of_sum 0..100

puts sq_sum - sum_sq
