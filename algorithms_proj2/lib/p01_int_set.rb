class MaxIntSet
  def initialize(max)
    @mis = Array.new(max, false)

  end

  def insert(num)
    if is_valid?(num)
      @mis[num-1] = true unless @mis[num-1]
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    if is_valid?(num)
      @mis[num-1] = false if @mis[num-1]
    else
      raise "Out of bounds"
    end
  end

  def include?(num)
    @mis[num-1]
  end

  private

  def is_valid?(num)
    num <= @mis.length && num >= 0
  end

  def validate!(num)

  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num) unless self.include?(num)
  end

  def remove(num)
    self[num].each_index do |i|
      if self[num][i] == num
        @store.delete_at(i)
        return num
      end
    end
  end

  def include?(num)
    self[num].each do |el|
      return true if el == num
    end

    return false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
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
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
