#!/usr/bin/env ruby

require 'prime'
prime_map = []

def sieve(upto_num)
	
	is_prime =[]

	prime_numbers = []

	upto_num.times{is_prime << true}

	(2..upto_num).each do |value|
		if is_prime[value] == true
			prime_numbers << value
			multiple = 2
			while value * multiple <= upto_num
				is_prime [value * multiple] = false
				multiple+=1
			end
		end
	end
	return prime_numbers
end

primes_to_two_million = sieve 2000000

sum = 0

primes_to_two_million.each do |prime|
	sum+=prime
end

puts sum