#
# [235] Lowest Common Ancestor of a Binary Search Tree
#
# https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/description/
#
# algorithms
# Easy (39.55%)
# Total Accepted:    174.9K
# Total Submissions: 442.3K
# Testcase Example:  '[2,1]\nnode with value 2\nnode with value 1'
#
# 
# Given a binary search tree (BST), find the lowest common ancestor (LCA) of
# two given nodes in the BST.
# 
# 
# 
# According to the definition of LCA on Wikipedia: “The lowest common ancestor
# is defined between two nodes v and w as the lowest node in T that has both v
# and w as descendants (where we allow a node to be a descendant of
# itself).”
# 
# 
# 
# ⁠       _______6______
# ⁠      /              \
# ⁠   ___2__          ___8__
# ⁠  /      \        /      \
# ⁠  0      _4       7       9
# ⁠        /  \
# ⁠        3   5
# 
# 
# 
# For example, the lowest common ancestor (LCA) of nodes 2 and 8 is 6. Another
# example is LCA of nodes 2 and 4 is 2, since a node can be a descendant of
# itself according to the LCA definition.
#
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
    low, high = [p.val, q.val].sort
    if low < root.val && high > root.val    
        return root
    end
    if low < root.val && high < root.val
        return lowest_common_ancestor root.left, p, q
    end
    if low > root.val && high > root.val
        return lowest_common_ancestor root.right, p, q
    end
    if low == root.val  && high > root.val
        return root
    end
    if high == root.val  && low < root.val
        return root
    end
end
