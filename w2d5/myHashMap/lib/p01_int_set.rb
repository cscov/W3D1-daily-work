class MaxIntSet
  attr_reader :max

  def initialize(max)
    @max = max
    @store = Array.new(max) { false }
  end

  def insert(num)
    raise "Out of bounds" if is_valid?(num)

    @store[num] = true unless include?(num)
  end

  def remove(num)
    raise "Out of bounds" if is_valid?(num)
    @store[num] = false

  end

  def include?(num)
    raise "Out of bounds" if is_valid?(num)
    return true if @store[num] == true
    false

  end

  private

  def is_valid?(num)
     num > max || num < 0
  end

  def validate!(num)

  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[ num % 20 ].push(num)
  end

  def remove(num)

    @store[ num % 20 ].delete(num)

  end

  def include?(num)
    @store[ num % 20].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`

  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    # raise "already present in set" if include?(num)

    resize! if num_buckets == @count
    unless include?(num)
      @store[ num % num_buckets ].push(num)
      @count += 1
    end
  end

  def remove(num)

    if include?(num)
      @store[num % num_buckets].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[ num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!

    result = Array.new(count * 2) { Array.new}

    @store.each do |bucket|
      bucket.each do |num|
        result[num % result.length].push(num)
      end
    end

    @store = result

  end
end
