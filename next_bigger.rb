# define the method swap! that swaps the argument input
class Array
  def swap!(a, b)
    self[a], self[b] = self[b], self[a]
    self
  end
end

def swap_special_case(array)
  # special case: there is no bigger number,
  # return -1
  return -1 if array.sort.reverse == array
  # special case: array is in ascending order and there are no doublicate numbers,
  # swap second last and last value, use return to stop program
  return array.swap!(-1, -2).join.to_i if array.sort == array && array.uniq.count == array.count
  # special case: array has 3 values or less, second last and last value are the same
  # swap third and second last value, use return to stop program
  return array.swap!(-2, -3).join.to_i if array[-1] == array[-2] && array.count <= 3
end

def swap_not_special_case(array)
  i = 1
  while i < array.count
    # look from right side for the first value that is bigger than the previous one (left side)
    if array[-i] > array[-i - 1]
      # range from -i till the last value, save range as until_last, sort it
      until_last = array[-i.. - 1].sort
      # find index of value to be switched
      to_switch = (until_last.find_index(until_last.detect { |x| x > array[-1-i] }) - until_last.count)
      # return range of array from left side beginning until value before -1
      # instert until_last in the previous
      # flatten this array and switch
      # return integer
      return array[0..-i - 1].push(until_last).flatten.swap!(-i - 1, to_switch).join.to_i
    end
    i += 1
  end
end

def next_bigger(n)
  # transform integer to array of digits, store in variable array
  array = n.to_s.chars.map(&:to_i)
  # perform swap if special case
  if array.sort.reverse == array ||
    array.sort == array && array.uniq.count == array.count ||
    array[-1] == array[-2] && array.count <= 3
    swap_special_case(array)
    # perform swap if not special case
  else swap_not_special_case(array)
  end
end
