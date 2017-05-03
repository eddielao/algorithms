require_relative 'bst_node'
require 'byebug'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = BSTNode.new(nil)
  end

# Return true or false
  def find(el)
    BinarySearchTree.find!(@root, el)
  end

  def self.find!(node, el)
    return nil if node.nil?
    return node if node.value == el

    if el < node.value
      return BinarySearchTree.find!(node.left, el)
    else
      return BinarySearchTree.find!(node.right, el)
    end
  end

  def insert(el)
    if @root.value == nil
      @root = BSTNode.new(el)
    else
      self.class.insert!(@root, el)
    end
  end

  def self.insert!(node, el)
    return BSTNode.new(el) if node.nil?
    if el <= node.value
      node.left = BinarySearchTree.insert!(node.left, el)
    else
      node.right = BinarySearchTree.insert!(node.right, el)
    end

    node
  end

  def delete(el)
    @root = self.class.delete!(@root, el)
  end

  def delete!(node, el)

  end

# If diff(left_depth - right_depth) <= 1 for every node
  def is_balanced?
    diff = (self.left.depth - self.right.depth).abs
    if diff <= 1
      true
    else
      false
    end
  end

  def in_order_traversal
  end

  def maximum
    return nil if self.nil?
    return self if self.right.nil?

    self.right.maximum
  end

  def depth
    return 0 if self.nil?
    1 + [self.left.depth + self.right.depth].max
  end 
end

if __FILE__ == $PROGRAM_NAME
  bst = BinarySearchTree.new
  arr = [1, 2, 3, 4, 5, 6]
  arr.each { |el| bst.insert(el) }
  puts bst
  puts bst.find(3)
end