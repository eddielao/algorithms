# This class just dumbs down a regular Array to be staticly sized.
class StaticArray
  attr_accessor :count

  def initialize(length)
    @count = 0
    @store = Array.new(length)
  end

  # O(1)
  def [](index)
    if index < @count
      @store[index]
    else
      raise "index out of bounds"
    end
  end

  # O(1)
  def []=(index, value)
    if index <= @count
      @store[index] = value
      @count += 1
    else
      raise "index out of bounds"
    end
  end

  protected
  attr_accessor :store
end
