/*
 * [189] Rotate Array
 *
 * https://leetcode.com/problems/rotate-array/description/
 *
 * algorithms
 * Easy (25.13%)
 * Total Accepted:    159.1K
 * Total Submissions: 633.1K
 * Testcase Example:  '[1]\n0'
 *
 * Rotate an array of n elements to the right by k steps.
 * For example, with n = 7 and k = 3, the array [1,2,3,4,5,6,7] is rotated to
 * [5,6,7,1,2,3,4]. 
 * 
 * Note:
 * Try to come up as many solutions as you can, there are at least 3 different
 * ways to solve this problem.
 * 
 * 
 * [show hint]
 * Hint:
 * Could you do it in-place with O(1) extra space?
 * 
 * 
 * Related problem: Reverse Words in a String II
 * 
 * Credits:Special thanks to @Freezen for adding this problem and creating all
 * test cases.
 */
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard k > 0 else { return }
        for _ in 1...k {
            if let a = nums.last {
                nums.remove(at: nums.count - 1)    
                nums.insert(a, at: 0)
            }
            
            
        }
    }
}
