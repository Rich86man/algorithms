#
# [173] Binary Search Tree Iterator
#
# https://leetcode.com/problems/binary-search-tree-iterator/description/
#
# algorithms
# Medium (42.83%)
# Total Accepted:    114.9K
# Total Submissions: 268.2K
# Testcase Example:  '[]'
#
# Implement an iterator over a binary search tree (BST). Your iterator will be
# initialized with the root node of a BST.
# 
# Calling next() will return the next smallest number in the BST.
# 
# Note: next() and hasNext() should run in average O(1) time and uses O(h)
# memory, where h is the height of the tree. 
# 
# Credits:Special thanks to @ts for adding this problem and creating all test
# cases.
#
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

class BSTIterator
    # @param {TreeNode} root
    attr_accessor :stack
    def initialize(root)
        @stack = []
        insert_into_stack root
    end

    def insert_into_stack(root) 
        return unless root
        insert_into_stack root.left
        @stack.push root.val
        insert_into_stack root.right
    end
    
    # @return {Boolean}
    def has_next
        !@stack.empty?
    end

    # @return {Integer}
    def next
        @stack.shift
    end
end

# Your BSTIterator will be called like this:
# i, v = BSTIterator.new(root), []
# while i.has_next()
#    v << i.next
# end
