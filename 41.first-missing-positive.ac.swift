/*
 * [41] First Missing Positive
 *
 * https://leetcode.com/problems/first-missing-positive/description/
 *
 * algorithms
 * Hard (25.75%)
 * Total Accepted:    119.3K
 * Total Submissions: 463.5K
 * Testcase Example:  '[1,2,0]'
 *
 * 
 * Given an unsorted integer array, find the first missing positive integer.
 * 
 * 
 * 
 * For example,
 * Given [1,2,0] return 3,
 * and [3,4,-1,1] return 2.
 * 
 * 
 * 
 * Your algorithm should run in O(n) time and uses constant space.
 * 
 */
class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var cache: [Int:Int] = [Int:Int]()
        nums.forEach { cache[$0] = 1 }
        
        for index in 1..<Int.max {
            if cache[index] == nil {
                return index
            }
        }
        return 0
    }
}
