class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next if @prev
    @next.prev = @prev if @next
    @next = nil
    @prev = nil
    self
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    if empty?
      nil
    else
      @head.next
    end
  end

  def last
    if empty?
      nil
    else
      @tail.prev
    end
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |l| 
      if l.key == key
        return l.val
      end
    end
    nil
  end

  def include?(key)
    any? { |l| l.key == key }
  end

  def append(key, val)
    nlink = Link.new(key, val)

    @tail.prev.next = nlink
    nlink.prev = @tail.prev
    nlink.next = @tail
    @tail.prev = nlink

    nlink
  end

  def update(key, val)
    each do |l|
      if l.key == key
        l.val = val
        return l;
      end
    end
  end

  def remove(key)
    each do |l|
      if l.key == key
        l.remove
        return l.val
      end
    end

    nil
  end

  def each
    current_link = @head.next
    until current_link == @tail
      yield current_link
      current_link = current_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
