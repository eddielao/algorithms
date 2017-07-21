require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @start_idx = 0
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    @store[@start_idx+index]
  end

  # O(1)
  def []=(index, val)
    @store[@start_idx+index] = val
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

  # O(1) ammortized
  def push(val)
    count = self.store.count
    if count >= @capacity
      self.resize!
    end
    nxt = count == 0 ? @start_idx : @capacity % count + @start_idx
    @store[nxt] = val
    @length += 1
  end

  # O(1)
  def shift
    count = self.store.count
    if count < 1
      raise "index out of bounds"
    else
      @start_idx += 1
      self.store.count -= 1
      @length -= 1
    end
  end

  # O(1) ammortized
  def unshift(val)
    self.store.count = @capacity
    if @length >= @capacity
      self.resize!
    end
    @start_idx = (@start_idx - 1) % @capacity
    @length += 1
    @store[@start_idx] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
    count = @store.count
    @capacity *= 2
    tmp = StaticArray.new(@capacity)
    count.times { |i| tmp[@start_idx+i] = @store[@start_idx+i] }
    @store = StaticArray.new(@capacity)
    count.times { |i| @store[@start_idx+i] = tmp[@start_idx+i] }
  end
end
