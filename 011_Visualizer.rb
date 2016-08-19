class String
	def black;          "\e[30m#{self}\e[0m" end
	def red;            "\e[31m#{self}\e[0m" end
	def green;          "\e[32m#{self}\e[0m" end
	def brown;          "\e[33m#{self}\e[0m" end
	def blue;           "\e[34m#{self}\e[0m" end
	def magenta;        "\e[35m#{self}\e[0m" end
	def cyan;           "\e[36m#{self}\e[0m" end
	def gray;           "\e[37m#{self}\e[0m" end

	def bg_black;       "\e[40m#{self}\e[0m" end
	def bg_red;         "\e[41m#{self}\e[0m" end
	def bg_green;       "\e[42m#{self}\e[0m" end
	def bg_brown;       "\e[43m#{self}\e[0m" end
	def bg_blue;        "\e[44m#{self}\e[0m" end
	def bg_magenta;     "\e[45m#{self}\e[0m" end
	def bg_cyan;        "\e[46m#{self}\e[0m" end
	def bg_gray;        "\e[47m#{self}\e[0m" end

	def bold;           "\e[1m#{self}\e[22m" end
	def italic;         "\e[3m#{self}\e[23m" end
	def underline;      "\e[4m#{self}\e[24m" end
	def blink;          "\e[5m#{self}\e[25m" end
	def reverse_color;  "\e[7m#{self}\e[27m" end
end

full_number = "08022297381500400075040507785212507791084949994017811857608717409843694804566200814931735579142993714067538830034913366552709523046011426924685601325671370236912231167151676389419236542240402866331380244732609903450244753353783684203517125032988128642367102638406759547066183864706726206802621220956394396308409166499421245558056673992697177878968314883489637221362309750076442045351400613397343133957817532822753167159403800462161409535692163905429635314755588824001754243629855786560048357189070544443744602158515417581980816805944769287392138652177704895540045208839735991607975732162626793327986688366887576220720346336746551232639353690442167338253911249472180846293240627636206936417230238834629969826759857404361620733529783190017431497148868116235705540170547183515469169233486143520189196748"

colortable = []

def construct_grid(width, height, number)
	# row, column

	str_length = number.length

	start_point = 0

	grid = []

	subarray = []

	while start_point < str_length
		char_string = number[start_point,2]
		subarray << char_string.to_i
		# puts char_string
		if subarray.length == 20
			grid << subarray
			subarray = []
		end

		start_point+=2
	end

	return grid

end

def pretty_print(grid, colors)
	grid.each_with_index do |subarray, i|
		subarray.each_with_index do |value, j|

			value_string = ""

			if value.to_s.length == 1
				value_string = "0#{value} "
			else
				value_string = "#{value} "
			end

			if colors[i][j] == true
				print value_string.green
			else
				print value_string
			end
		end
		puts
	end
end

def parse_complete(number, width, height)
	reference = 0
	start_index = 0
	end_index = 1

	while end_index < number.length
		# Things happen

		stash = 

		start_index += 1
		end_index += 1
	end
end

def parse_array(array)
	# Code goes here
	start_index = 0
	end_index = 3

	largest = 0

	while end_index < array.length

		temporary_array = array[start_index, end_index]

		product = 1

		temporary_array.each do |value|
			product *= value
		end

		if product > largest
			largest = product
		end

		end_index+=1
		start_index+=1
	end

	return largest
end

def get_horizontals(grid)

	largest_horizontal = 0

	grid.each do |subarray|
		subarray_value = parse_array subarray

		if largest_horizontal < subarray_value
			largest_horizontal = subarray_value
		end
	end
	return largest_horizontal
end

def get_verticals(grid)

	largest_vertical = 0

	index = 0

	while index < grid.length
		staging_array = []

		grid.each do |subgrid|
			staging_array << subgrid[index]
		end

		result = parse_array staging_array

		if result > largest_vertical
			largest_vertical = result
		end

		index += 1
	end
	return largest_vertical
end

def get_l_diagonals(grid)
	index = 0

	staging_array = []

	while index < grid.length
		# print "#{grid[index][index]} "
		staging_array << grid[index][index]
		index+=1
	end

	return parse_array staging_array

end

def get_r_diagonals(grid)
	index = grid.length-1

	staging_array = []

	while index > 0
		# print "#{grid[index][index]} "
		staging_array << grid[index][index]
		index-=1
	end

	return parse_array staging_array
end

the_grid = construct_grid 20, 20, full_number
colortable = Array.new(the_grid)

colortable.each_with_index do |subarray, i|
	subarray.each_with_index do |value, j|
		if(the_grid[i][j] % 5 == 0)
			colortable[i][j] = false
		end
	end
end

puts
pretty_print the_grid, colortable

