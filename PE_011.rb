#!/usr/bin/env ruby

full_number = "08022297381500400075040507785212507791084949994017811857608717409843694804566200814931735579142993714067538830034913366552709523046011426924685601325671370236912231167151676389419236542240402866331380244732609903450244753353783684203517125032988128642367102638406759547066183864706726206802621220956394396308409166499421245558056673992697177878968314883489637221362309750076442045351400613397343133957817532822753167159403800462161409535692163905429635314755588824001754243629855786560048357189070544443744602158515417581980816805944769287392138652177704895540045208839735991607975732162626793327986688366887576220720346336746551232639353690442167338253911249472180846293240627636206936417230238834629969826759857404361620733529783190017431497148868116235705540170547183515469169233486143520189196748"

def construct_grid(width, height, number)
	# row, column

	str_length = number.length

	start_point = 0

	grid = []

	subarray = []

	while start_point < str_length
		char_string = number[start_point,2]
		subarray << char_string.to_i

		if subarray.length == 20
			grid << subarray
			subarray = []
		end

		start_point+=2
	end

	return grid

end

def get_horizontals(grid)

	largest_horizontal = 0

	grid.each do |subarray|
		start_index = 0
		end_index = 3

		largest = 0

		while end_index < subarray.length
			quartet = subarray[start_index,end_index]

			product = 1

			quartet.each do |number|
				product*=number
			end

			if product > largest
				largest = product
			end

			start_index+=1
			end_index+=1
		end

		if largest_horizontal < largest
			largest_horizontal = largest
		end
	end
	puts largest_horizontal
end

def get_verticals(grid)


	grid.each_with_index do |subgrid, index|
		subgrid
	end
end

def get_l_diagonals(grid)
end

def get_r_diagonals(grid)
end

def parse_line(line)
	l = line.to_s.length
	beginning = 0
	ending = 3
	largest = 1

	while ending < l
		product = 1
		as_string = line.to_s
		(beginning..ending).each do |number|
			factor = as_string[number].to_i
			product*=factor
		end

		if product > largest
			largest = product
		end

		beginning+=1
		ending+=1
		
	end
	return largest
end

def pretty_print(grid)

	grid.each do |subarray|
		subarray.each do |value|
			print "#{value} "
		end
		puts
	end


end



get_horizontals construct_grid 20, 20, full_number
