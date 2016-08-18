numbers_array = []

for i in 1..999
	if i % 3 == 0 or i % 5 == 0
		#numbers_array.push(i)
		puts ("(*) #{i}")
		numbers_array.push(i)
	# else
	# 	puts "i = #{i}"
	end
end

sum = numbers_array.inject(:+)

puts sum
