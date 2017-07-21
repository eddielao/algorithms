require_relative "static_array"
require 'byebug'

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    @store[index] = value
  end

  # O(1)
  def pop
    count = self.store.count
    if count < 1
      raise "index out of bounds"
    else
      self.store.count -= 1
      @length -= 1
    end
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    nxt = self.store.count
    if nxt >= @capacity
      self.resize!
    end
      @store[nxt] = val
      @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    count = self.store.count
    if count < 1
      raise "index out of bounds"
    else
      count.times { |i| @store[i] = @store[i+1] }
      self.store.count -= 1
      @length -= 1
    end
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    nxt = self.store.count
    if nxt >= @capacity
      self.resize!
    end
    (nxt).downto(1) { |i| @store[i] = @store[i-1] }
    @store[0] = val
    @length += 1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)

  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    count = @store.count
    @capacity *= 2
    tmp = StaticArray.new(@capacity)
    count.times { |i| tmp[i] = @store[i] }
    @store = StaticArray.new(@capacity)
    count.times { |i| @store[i] = tmp[i] }
  end
end
