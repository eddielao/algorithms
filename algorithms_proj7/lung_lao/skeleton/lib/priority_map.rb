require_relative 'heap2'

class PriorityMap
  def initialize(&prc)
    @map = {}
    @queue = BinaryMinHeap.new do |i, j|
      prc.call(@map[i], @map[j])
    end
  end

  def [](key)
    if @map.has_key?(key)
      return @map[key]
    else
      return nil
    end
  end

  def []=(key, value)
    if @map.has_key?(key)
      update(key, value)
    else
      insert(key, value)
    end
  end

  def count
    @map.count
  end

  def empty?
    count == 0
  end

  def extract
    key = @queue.extract
    value = @map.delete(key)
    [key, value]
  end

  def has_key?(key)
    @map.has_key?(key)
  end

  protected
  attr_accessor :map, :queue

  def insert(key, value)
    @queue.push(key)
    @map[key] = value
    nil
  end

  def update(key, value)
    if @map.has_key?(key)
      @map[key] = value
      @queue.reduce!(key)
    end
    nil
  end
end
