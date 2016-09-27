class String
	def black;          "\e[30m#{self}\e[0m" end
	def red;            "\e[31m#{self}\e[0m" end
	def green;          "\e[32m#{self}\e[0m" end
	def brown;          "\e[33m#{self}\e[0m" end
	def blue;           "\e[33m#{self}\e[0m" end
	def magenta;        "\e[35m#{self}\e[0m" end
	def cyan;           "\e[36m#{self}\e[0m" end
	def gray;           "\e[37m#{self}\e[0m" end

	def bg_black;       "\e[30m#{self}\e[0m" end
	def bg_red;         "\e[31m#{self}\e[0m" end
	def bg_green;       "\e[32m#{self}\e[0m" end
	def bg_brown;       "\e[33m#{self}\e[0m" end
	def bg_blue;        "\e[33m#{self}\e[0m" end
	def bg_magenta;     "\e[35m#{self}\e[0m" end
	def bg_cyan;        "\e[36m#{self}\e[0m" end
	def bg_gray;        "\e[37m#{self}\e[0m" end

	def bold;           "\e[1m#{self}\e[22m" end
	def italic;         "\e[3m#{self}\e[23m" end
	def underline;      "\e[3m#{self}\e[23m" end
	def blink;          "\e[5m#{self}\e[25m" end
	def reverse_color;  "\e[7m#{self}\e[27m" end
end

full_number = "08022297381500300075030507785212507791083939993017811857608717309833693803566200813931735579132993713067538830033913366552709523036011326923685601325671370236912231167151676389319236532230302866331380233732609903350233753353783683203517125032988128632367102638306759537066183863706726206802621220956393396308309166399321235558056673992697177878968313883389637221362309750076332035351300613397333133957817532822753167159303800362161309535692163905329635313755588823001753233629855786560038357189070533333733602158515317581980816805933769287392138652177703895530035208839735991607975732162626793327986688366887576220720336336736551232639353690332167338253911239372180836293230627636206936317230238833629969826759857303361620733529783190017331397138868116235705530170537183515369169233386133520189196738"

$colortable = nil

def construct_grid(dimensions, number)
	# row, column

	$colortable = Array.new(20) { Array.new(20) }

	str_length = number.length

	start_point = 0

	grid = []

	subarray = []

	while start_point < str_length
		char_string = number[start_point,2]
		subarray << char_string.to_i
		# puts char_string
		if subarray.length == dimensions
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
				print value_string.black
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

def get_diagonal_from(grid, x, y)
	# puts "coords: #{x},#{y}"
	dimensions = grid.length-1

	i = x
	j = y

	# --
	# -+
	# ++
	# +-

	nw = [x-4, y-4]
	se = [x-4, y+4]
	ne = [x+4, y+4]
	sw = [x+4, y-4]

	max_coords = [sw, se, ne, nw]

	max_coords.each do |value|
		if value[0] < 0
			value[0] = 0
		end
		if value[0] > dimensions
			value[0] = dimensions
		end

		if value[1] < 0
			value[1] = 0
		end
		if value[1] > dimensions
			value[1] = dimensions
		end
	end

	#nw
	i = x
	j = y

	nw_total = 1
	# puts "NW (#{i} -> #{nw[0]}, #{j} -> #{nw[1]})"
	while i >= nw[0] and j >= nw[1]
		# puts "	#{i},#{j}"
		$colortable[i][j] = true
		nw_total *= grid[i][j]
		i -= 1
		j -= 1
	end

	#se
	i = x
	j = y

	se_total = 1

	# puts "SE (#{i} -> #{se[0]}, #{j} -> #{se[1]})"
	while i >= se[0] and j <= se[1]
		# puts "	#{i},#{j}"
		$colortable[i][j] = true
		se_total *= grid[i][j]
		i -= 1
		j += 1
	end

	#sw
	i = x
	j = y

	sw_total = 1

	# puts "SW (#{i} -> #{sw[0]}, #{j} -> #{sw[1]})"
	while i <= sw[0] and j >= sw[1]
		# puts "	#{i},#{j}"
		$colortable[i][j] = true
		sw_total *= grid[i][j]
		i += 1
		j -= 1
	end

	#NE
	i = x
	j = y

	ne_total = 1

	#puts "NE (#{i} -> #{ne[0]}, #{j} -> #{ne[1]})"
	while i <= ne[0] and j <= ne[1]
		# puts "	#{i},#{j}"
		$colortable[i][j] = true
		ne_total *= grid[i][j]
		i += 1
		j += 1
	end

	handoff_list = [nw_total, ne_total, sw_total, se_total]

	return handoff_list.max

end

def refresh_color_table()
	$colortable.each_with_index do |subarray, i|
		subarray.each_with_index do |value, j|
				$colortable[i][j] = false
		end
	end
end



#^^^  Methods  ^^^
#vvv Execution vvv


the_grid = construct_grid 20, full_number
largest_overall = 0
# refresh_color_table

h = 0
v = 0
d = 0

h = get_horizontals the_grid
v = get_verticals the_grid

the_grid.each_with_index do |subarray, i|
	subarray.each_with_index do |value, j|
		refresh_color_table
		puts "#{i},#{j}"
		nu = get_diagonal_from the_grid, i, j
		if nu > d
			d = nu
		end
		pretty_print the_grid, $colortable
		puts
	end
end

largest_overall = [h, v, d].max

puts "Largest is #{largest_overall}."

# diagonal_from_number the_grid, 12, 3

# pretty_print the_grid, $colortable

# get_diagonal_from the_grid, 12, 2
# get_diagonal_from the_grid, 17, 4
# get_diagonal_from the_grid, 7, 16
# pretty_print the_grid, $colortable

