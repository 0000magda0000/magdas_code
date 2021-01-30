class Array
  # defining the function swap! that swaps the given argument input
  def swap! (a, b)
    self[a], self[b] = self[b], self[a]
    self
  end
end

def next_bigger(n)
  # convert n (number) into array of integers, storing this array in the variable a
  a = n.to_s.chars.map { |x| x.to_i }
  # test for the special case that a and a reverse are the same, return -1 if so
  if a.sort.reverse == a
    -1
  # test for the special case that a is already ascending digits AND
  # test for dublicates within a, if so swap digits
  elsif a.sort == a && a.uniq.count == a.count
    a.swap!(-1, -2).join.to_i
  # test if the last two numbers in the array are the same AND
  # test for the special case that a has lenght of 3 or less
  elsif a[-1] == a[-2] && a.count <= 3
    a.swap!(-2, -3).join.to_i
  end

  i = 1
  # loop while a length is bigger than i
  while i < a.count
    # if value from index i in a is bigger than the previous number in the array
    if a[-i] > a[-i - 1]
      # then set variable b to be the range of the value of index i until the last value of a -
      # sort these values ascending
      b = a[-i..-1].sort
      # then search for index within b, substract b length from it, store in variable c
      c = (b.find_index(b.detect { |x| x > a[-1 - i] }) - b.count)
      # return values from array a from index 0 until -i -1, add b to the array a
      # swap values of index -i -1 and c - turn this into integer
      a[0..-i - 1].push(b).flatten.swap!(-i - 1, c).join.to_i
    end
    i += 1
  end
end
