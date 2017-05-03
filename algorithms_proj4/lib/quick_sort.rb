class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1
    random_start = rand(length-1)
    pivot_idx = self.partition(array, random_start, length-random_start-1)
    array = self.sort2!(array, 0, pivot_idx+1) +
      self.sort2!(array, pivot_idx+1, length-pivot_idx-1)
  end

  def self.partition(array, start, length, &prc)
    pivot_idx = start
    pivot_val = array[pivot_idx]
    barrier = pivot_idx

    (pivot_idx+1).upto(pivot_idx+length-1) do |i|
      i_val = array[i]
      if i_val < pivot_val
        barrier = (barrier + 1)
        barrier_val = array[barrier]
        array[barrier], array[i] = i_val, barrier_val
      end
    end

    array[pivot_idx], array[barrier] = array[barrier], array[pivot_idx]
    pivot_idx = barrier
  end
end
