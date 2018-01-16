/*
 * [104] Maximum Depth of Binary Tree
 *
 * https://leetcode.com/problems/maximum-depth-of-binary-tree/description/
 *
 * algorithms
 * Easy (53.70%)
 * Total Accepted:    293.7K
 * Total Submissions: 546.8K
 * Testcase Example:  '[]'
 *
 * Given a binary tree, find its maximum depth.
 * 
 * The maximum depth is the number of nodes along the longest path from the
 * root node down to the farthest leaf node.
 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        return _maxDepth(root, 0)
    }
    
    func _maxDepth(_ root: TreeNode?, _ depth: Int) -> Int {
        guard let root = root else { return depth }
        return max(_maxDepth(root.left, depth + 1), _maxDepth(root.right, depth + 1))
    }
}
