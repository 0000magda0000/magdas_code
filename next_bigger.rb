class Array
  # defining the function swap! that swaps the given argument input
  def swap! (a, b)
    self[a], self[b] = self[b], self[a]
    self
  end
end

def next_bigger(n)
  # convert n into array of integers, storing this array in the variable a
  a = n.to_s.chars.map { |x| x.to_i }
  # test for the special case that a and a reverse are the same, return -1 if so
  if a.sort.reverse == a
    -1
  # test for the special case that a is already ascending digits and
  # test for dublicates, if so
  elsif a.sort == a && a.uniq.count == a.count
    a.swap!(-1, -2).join.to_i
  # test for the special case
  elsif a[-1] == a[-2] && a.count <= 3
    a.swap!(-2, -3).join.to_i
end

  i = 1
  while i < a.count
    if a[-i] > a[-i - 1]
      b = a[-i..-1].sort
      c = (b.find_index(b.detect { |x| x > a[-1 - i] }) - b.count)
      a[0..-i - 1].push(b).flatten.swap!(-i - 1, c).join.to_i
    end
    i += 1
  end
end
