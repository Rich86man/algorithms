/*
 * [561] Array Partition I
 *
 * https://leetcode.com/problems/array-partition-i/description/
 *
 * algorithms
 * Easy (66.49%)
 * Total Accepted:    59.9K
 * Total Submissions: 90.1K
 * Testcase Example:  '[1,4,3,2]'
 *
 * 
 * Given an array of 2n integers, your task is to group these integers into n
 * pairs of integer, say (a1, b1), (a2, b2), ..., (an, bn) which makes sum of
 * min(ai, bi) for all i from 1 to n as large as possible.
 * 
 * 
 * Example 1:
 * 
 * Input: [1,4,3,2]
 * 
 * Output: 4
 * Explanation: n is 2, and the maximum sum of pairs is 4 = min(1, 2) + min(3,
 * 4).
 * 
 * 
 * 
 * Note:
 * 
 * n is a positive integer, which is in the range of [1, 10000].
 * All the integers in the array will be in the range of [-10000, 10000].
 * 
 * 
 */
class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        let sorted = nums.sorted()
        var total = 0
        var index = 0
        while index < sorted.count {
            let l = sorted[index]
            let r = index + 1 < sorted.count ? sorted[index + 1] : Int.max

            total += min(l, r)
            index += 2
        }
        
        return total
    }
}
