#!/usr/bin/env ruby

smallest = 0
current = 1
found_one = false
keep_bothering = true

while keep_bothering

	if current % 2 ** 32 == 0
		keep_bothering = false
		puts "Broke after #{current}"
	end

	count_of_divisibility = 0

	for i in 1..20
		if current % i == 0
			count_of_divisibility += 1
		end
	end

	if count_of_divisibility == 20
		keep_bothering = false
		smallest = current
	else
		current += 1
	end

end

puts smallest