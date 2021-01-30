def choose_best_sum(t, k, ls)
  # t is limit of km to be driven
  # k is number of towns to be visitd
  # ls is array of distances between towns
  # Setting variable i to be 0
  i = 0
  # Creating an empty array called array
  array = []

  # Loop through all the possible combinations of sums of distances
  # with k as the number of towns to be visited therefor the number of digits of the combination
  # and saving those in the array
  while i < ls.count
    (array << ls.combination(k).to_a.map(&:sum))
    i += 1
  end
  # Return nil if max of array is nil
  if (array.flatten.max == nil)
    nil
  # Return max of array if smaller than t
  elsif (array.flatten.max < t)
    array.flatten.max
  # Return t if t exists (index is not nil)
  elsif array.flatten.find_index(t) != nil
    t
  # Else return value (x) of array that is the next smallest to t
  else array.flatten.sort.reverse.bsearch { |x| x <= t }
  end
end
