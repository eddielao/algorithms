 # Binary tree must be a complete tree
 # Children must be >= their parents for each node
 # After insertion, if parent is larger, do swap.
 # When swapping down, swap with the smaller of 2 children.
 # Index:children: 0:(1, 2), 1:(3, 4), 2:(5, 6), 3:(7,8), 4:(9, 10)
 # [left child = 2*i+1 and right child = 2*i+2]
 # Given index of child, parent = Int((i - 1) / 2)

 class BinaryMinHeap
  def initialize(&prc)
    @store = []
  end

  def count
    @store.length
  end

  def extract
    extracted = @store[0]
    if count > 1
      @store[0] = @store.pop
      BinaryMinHeap.heapify_down(@store, 0, self.count, &prc)
    else
      @store.pop
    end
    extracted
  end

# Min
  def peek
    @store[0]
  end

  def push(val)
    @store << val
    BinaryMinHeap.heapify_up(@store, self.count-1, &prc)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    children_i = []
    last_i = len - 1
    left_child_i = 2 * parent_index + 1
    right_child_i = 2 * parent_index + 2

    if last_i >= left_child_i
      children_i << left_child_i
      if last_i >= right_child_i
        children_i << right_child_i
      end
    end

    children_i
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    swapped = true

    while swapped do
      swapped = false
      parent = array[parent_idx]
      child_indices = self.child_indices(len, parent_idx)
      left_ci = child_indices[0]
      return array unless !!left_ci
      left_child = array[left_ci]

      right_ci = child_indices[1]
      if !!right_ci
        right_child = array[right_ci]
      else
        if prc.call(parent, left_child) > 0
          array[parent_idx], array[left_ci] = left_child, parent
        end
        return array
      end

      if right_child < left_child && prc.call(parent, right_child) > 0
        array[parent_idx], array[right_ci] = right_child, parent
        swapped = true
        parent_idx = right_ci
      elsif prc.call(parent, left_child) > 0
        array[parent_idx], array[left_ci] = left_child, parent
        swapped = true
        parent_idx = left_ci
      else
        return array
      end
    end
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    swapped = true
    while swapped && child_idx != 0 do
      swapped = false
      parent_idx = parent_index(child_idx)
      parent = array[parent_idx]
      child = array[child_idx]
      if prc.call(child, parent) < 0
        array[child_idx], array[parent_idx] = parent, child
        child_idx = parent_idx
        swapped = true
      end
    end

    array
  end
end
