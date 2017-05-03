require 'byebug'

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
    self[num].push(num) unless include?(num)
    @count += 1
    resize! if @count > num_buckets
  end

  def remove(num)
    @store[num].each_index do |i|
      el = @store[num][i]
      if el == num
        @store[num].delete_at(i)
        @count -= 1
        return el
      end
    end
  end

  def include?(num)
    self[num].each { |el| return true if el == num }
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

  def resize!
    original = @store.length

    tmp = @store

    @store = Array.new(original * 2) {Array.new}
    @count = 0

    tmp.each_index do |arr|
      tmp[arr].each do |el|
        mod = el % num_buckets
        @store[mod].push(el)
        @count += 1
      end
    end
    @store
  end
end
