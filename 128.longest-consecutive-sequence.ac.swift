/*
 * [128] Longest Consecutive Sequence
 *
 * https://leetcode.com/problems/longest-consecutive-sequence/description/
 *
 * algorithms
 * Hard (37.79%)
 * Total Accepted:    127.2K
 * Total Submissions: 336.7K
 * Testcase Example:  '[100,4,200,1,3,2]'
 *
 * 
 * Given an unsorted array of integers, find the length of the longest
 * consecutive elements sequence.
 * 
 * 
 * For example,
 * Given [100, 4, 200, 1, 3, 2],
 * The longest consecutive elements sequence is [1, 2, 3, 4]. Return its
 * length: 4.
 * 
 * 
 * Your algorithm should run in O(n) complexity.
 * 
 */
class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        var count = 1
        var maxCount = 1
        var s = nums.sorted()
        var previous = s.first
        for index in 1..<nums.count {
            
            if s[index] == (previous!) {
                
            } else if s[index] == (previous! + 1) {
                count += 1
                maxCount = max(count, maxCount)
            } else {
                count = 1
            }
            previous = s[index]
        }
        return maxCount
    }
}
