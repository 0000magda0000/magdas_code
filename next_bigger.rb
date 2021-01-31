# define the method swap! that swaps the argument input
class Array
  def swap!(a, b)
    self[a], self[b] = self[b], self[a]
    self
  end
end

# special case 1: there is no bigger number, because array is already in descending order
def special_case_1?(array)
  array.sort.reverse == array
end

# special case 2: array is in ascending order
def special_case_2?(array)
  array.sort == array && array.uniq.count == array.count
end

# special case 3: array has 3 values or less, second last and last value are the same
def special_case_3?(array)
  array.count <= 3 && array[-1] == array[-2]
end

def swap_special_case(array)
  return -1 if special_case_1?(array)
  return array.swap!(-1, -2).join.to_i if special_case_2?(array)
  return array.swap!(-2, -3).join.to_i if special_case_3?(array)
end

def swap_not_special_case(array)
  i = 1
  while i < array.count
    if array[-i] > array[-i - 1]
      until_last = array[-i..-1].sort
      to_switch = (until_last.find_index(until_last.detect { |x| x > array[-1 - i] }) - until_last.count)
      return array[0..-i - 1].push(until_last).flatten.swap!(-i - 1, to_switch).join.to_i
    end
    i += 1
  end
end

def next_bigger(n)
  array = n.to_s.chars.map(&:to_i)
  if special_case_1?(array) || special_case_2?(array) || special_case_3?(array)
    swap_special_case(array)
  else swap_not_special_case(array)
  end
end
