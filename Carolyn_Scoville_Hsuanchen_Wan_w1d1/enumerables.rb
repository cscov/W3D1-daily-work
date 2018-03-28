class Array
  def my_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self
  end

  def my_select
    arr = []
    self.my_each do |el|
      arr << el  if yield el
    end
    arr
  end

  def my_reject
    arr = []
    self.my_each do |el|
      arr << el  unless yield el
    end
    arr
  end

  def my_any?
    i = 0
    while i < self.length
      return true if yield self[i]
      i += 1
    end
    false
  end

  def my_all?
    i = 0
    while i < self.length
      return false unless yield self[i]
      i += 1
    end
    true
  end

  def my_flatten
    arr = []
    self.my_each do |el|
      if el.is_a?(Array)
        el.my_flatten.my_each do |el2|
          arr << el2
        end
      else
        arr << el
      end
    end

    arr
  end

  def my_zip(*args)
    arr = Array.new(self.length) { Array.new }
    i = 0
    while i < self.length
      arr[i] << self[i]
      args.my_each do |a|
        arr[i] << a[i]
      end
      i += 1
    end
    arr
  end

  def my_rotate(shift = 1)
    if shift < 0
      shift = (self.length - shift.abs) % self.length
    else
      shift = shift % self.length
    end
    shifted = self.take(shift)
    arr = self.drop(shift)
    shifted.my_each do |el|
      arr << el
    end

    arr
  end

  def my_join(separator = '')
    joined = ""
    i = 0
    while i < self.length
      joined << self[i]
      joined << separator unless i == self.length - 1
      i += 1
    end
    joined
  end

  def my_reverse
    i = self.length - 1
    arr = []
    while i >= 0
      arr << self[i]
      i -= 1
    end
    arr
  end
end

def factors(num)
  (1..num).to_a.select do |el|
    num % el == 0
  end
end

class Array
  def bubble_sort!(&prc)
    prc ||= Proc.new { |a, b| a <=> b }
    sorted = false
    until sorted
      sorted = true
      self.each_with_index do |el, i|
        if prc.call(el, self[i + 1]) == 1
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end
    end

    self
  end

  def bubble_sort(&prc)
    arr = self.dup
    arr.bubble_sort!(&prc)
  end
end

def substrings(string)
  arr = []
  (0...string.length).to_a.repeated_combination(2) do |a, b|
    arr << string[a..b]

  end
  arr
end

def subwords(word, dictionary)
  substrings(word).select do |el|
    dictionary.include?(el)
  end
end
p subwords("cat", ["cat", "a", "at"])
# substrings("cat") # => ["c", "ca", "cat", "a", "at",
# "t"]`.
# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# p return_value
#
# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # =>
#
# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]
#
# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
#
# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
