#!/usr/bin/env ruby

# Solution {200, 375, 425} = 31875000

# def return_triple(index)
# 	a = 2*index+1
# 	b = 2*index*(index+1)
# 	c = b+1

# 	# a = (3*index) ** 2
# 	# b = (4*index) ** 2
# 	# c = (5*index) ** 2

# 	triangle = a**2 + b**2 == c**2
	
# 	return[a, b, c]
# end

# def sqrt_array(array)
# 	return_array = []
# 	array.each do |value|
# 		return_array << Math.sqrt(value)
# 	end
# 	return return_array
# end

# def get_doubles(triple)
	
# 	a = triple[0]
# 	b = triple[1]
# 	c = triple[2]

# 	trips = []

# 	index = 0

# 	while c < 500
# 		a*=index
# 		b*=index
# 		c*=index

# 		# puts "#{a}^2 + #{b}^2 = #{c}^2"
# 		index+=1
# 	end

# end




# sum = 0
# current_triple = []
# product = 0
# index = 1

# while index < 10
# 	triple_sum = 0
	
# 	triple = return_triple index

# 	current_triple = triple
# 	puts "---------------------------"

# 	get_doubles triple

# 	triple.each do |number|
# 		triple_sum+=number
# 	end

# 	puts "sum of p.#{index} (#{triple[0]}, #{triple[1]}, #{triple[2]}) = #{triple_sum}"
# 	sum = triple_sum
# 	index+=1
# end


# (1..100).each do |indexer|
# 	get_doubles return_triple indexer
# 	puts "------------------------------------"
# end



# ayys = [30, 30, 24, 24, 18]
# bees = [8, 6, 18, 10, 24]
# cees = [6, 8, 10, 18, 10]

# ayys.each_with_index do |number, index|
# 	puts ayys[index] + bees[index] + cees[index]
# end

 
# (0..600).each do |index|
# 		triple_dog = return_triple index
# 		puts "#{triple_dog[0]}, #{triple_dog[1]}, #{triple_dog[2]}"
# 		if (triple_dog[0] + triple_dog[1] + triple_dog[2]) == 1000
# 			puts "#{triple_dog[0]}, #{triple_dog[1]}, #{triple_dog[2]}"
# 		end
# 	end


1.upto(1000) do |a|
	a.upto(1000 - a) do |b|
		b.upto(1000 - a - b) do |c|
			# puts "#{a}, #{b}, #{c}"
			puts "SOLUTION: #{a}, #{b}, #{c}" if (a + b + c == 1000) && (a**2 + b**2 == c**2) 
		end
	end
end

# 1.upto(1000) do |a|
# 	a.upto(1000 - a) do |b|
# 		b.upto(1000 - a - b) do |c|
# 			# puts "#{a} + #{b} + #{c}"
# 			puts "#{a} + #{b} + #{c} = #{a + b + c}" if (a + b + c == 1000) && (a**2  + b**2 == c**2)
# 		end
# 	end
# end



