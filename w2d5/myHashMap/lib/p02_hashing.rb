
class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0
    return result.hash if self.empty?
    self.each_with_index do |el, idx|
      result +=  (idx + el.hash).hash
    end
    result
  end

end

class String
  def hash
    result = 0

    self.each_char.with_index do |char, idx|
      result += (char.ord + idx).hash
    end

    result
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0

    self.each do |k,v|
      result += (k.to_s.ord + v.ord).hash
    end

    result
  end
end
