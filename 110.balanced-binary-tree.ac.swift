/*
 * [110] Balanced Binary Tree
 *
 * https://leetcode.com/problems/balanced-binary-tree/description/
 *
 * algorithms
 * Easy (38.05%)
 * Total Accepted:    206.4K
 * Total Submissions: 542.4K
 * Testcase Example:  '[]'
 *
 * Given a binary tree, determine if it is height-balanced.
 * 
 * 
 * 
 * For this problem, a height-balanced binary tree is defined as a binary tree
 * in which the depth of the two subtrees of every node never differ by more
 * than 1.
 * 
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
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        guard abs(depth(root.left) - depth(root.right)) <= 1 else { return false }
        return isBalanced(root.left) && isBalanced(root.right)
        
    }
    
    func depth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        return 1 + max(depth(root.left), depth(root.right))
    }
}
