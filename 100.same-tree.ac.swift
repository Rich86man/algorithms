/*
 * [100] Same Tree
 *
 * https://leetcode.com/problems/same-tree/description/
 *
 * algorithms
 * Easy (47.25%)
 * Total Accepted:    241.5K
 * Total Submissions: 511.1K
 * Testcase Example:  '[1,2,3]\n[1,2,3]'
 *
 * 
 * Given two binary trees, write a function to check if they are the same or
 * not.
 * 
 * 
 * Two binary trees are considered the same if they are structurally identical
 * and the nodes have the same value.
 * 
 * 
 * 
 * 
 * Example 1:
 * 
 * Input:     1         1
 * ⁠         / \       / \
 * ⁠        2   3     2   3
 * 
 * ⁠       [1,2,3],   [1,2,3]
 * 
 * Output: true
 * 
 * 
 * 
 * Example 2:
 * 
 * Input:     1         1
 * ⁠         /           \
 * ⁠        2             2
 * 
 * ⁠       [1,2],     [1,null,2]
 * 
 * Output: false
 * 
 * 
 * 
 * Example 3:
 * 
 * Input:     1         1
 * ⁠         / \       / \
 * ⁠        2   1     1   2
 * 
 * ⁠       [1,2,1],   [1,1,2]
 * 
 * Output: false
 * 
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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        switch (p, q) {
        case (.none, .none):
            return true
        case (.some(let a), .some(let b)) where a.val == b.val:
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        default:
            return false
        }
        if p == nil && q == nil { return true }

        let same = isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
            guard let p = p,
              let q = q,
              p.val == q.val
        else { return false }
        return same        
    }
}
