class Map
  attr_reader :map

  def initialize
    @map = Array.new
  end

  def assign(key, value)
    if self.lookup(key)
      index = @map.flatten.find_index(key)
      @map[index] = value
    else
      @map << [key, value]
    end
  end

  def lookup(key)
    @map.each do |pair|
      return true if pair.first == key
    end
    false
  end

  def remove(key)
    if self.lookup(key)
      index = @map.find(key)
      @map.delete_at(index)
    end
  end

  def show
    @map
  end
end

map = Map.new
p map.show
map.assign("apples", 2)
p map.show
# debugger
map.assign("apples", 3)
p map.show
map.assign("oranges", 4)
p map.show
map.remove("oranges")
p map.show
