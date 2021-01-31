def choose_best_sum(t, k, ls)
  array = []
  # finding all sums of combinations
  ls.count.times do
    array << ls.combination(k).to_a.map(&:sum)
  end
  find_next_biggest(array, t)
end

def find_next_biggest(array, t)
  array.flatten.reject!(&:nil?)
  # Return t if t is part of array
  if array.flatten.include? t
    t
  # Return the next biggest value of t
  else array.flatten.sort.reverse.bsearch { |x| x <= t }
  end
end
