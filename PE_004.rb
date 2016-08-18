#!/usr/bin/env ruby

$palindromes = []

def parse(num1, num2)
	largest = []
	product = num1 * num2

	string = product.to_s
	backwards = product.to_s

	backwards.reverse!
	# puts "#{string} : #{backwards}"

	if string == backwards
		# puts "#{product} is a palindrome"
		#$palindromes << [num1, num2]
		$palindromes << product
	end
end

top_to_bottom = []
bottom_to_top = [] 

(0..999).each { | counter | top_to_bottom << counter}

bottom_to_top = top_to_bottom.reverse

if __FILE__ == $0
	for i in top_to_bottom
		for j in bottom_to_top
			parse i, j
		end
	end

	$palindromes.sort!
	puts $palindromes[-1]

end
