#!/usr/bin/env ruby

require 'prime'

prime_array = []

prime_div = 600851475143

prime_array = Prime.prime_division(prime_div)

puts prime_array[-1]
