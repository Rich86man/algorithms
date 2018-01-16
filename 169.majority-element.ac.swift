/*
 * [169] Majority Element
 *
 * https://leetcode.com/problems/majority-element/description/
 *
 * algorithms
 * Easy (47.47%)
 * Total Accepted:    235.3K
 * Total Submissions: 495.7K
 * Testcase Example:  '[1]'
 *
 * Given an array of size n, find the majority element. The majority element is
 * the element that appears more than ⌊ n/2 ⌋ times.
 * 
 * You may assume that the array is non-empty and the majority element always
 * exist in the array.
 * 
 * Credits:Special thanks to @ts for adding this problem and creating all test
 * cases.
 */
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var cache: [Int: Int] = [:]
        
        for index in 0..<nums.count {
            cache[nums[index], default: 0] += 1
            if cache[nums[index], default: 0] > nums.count / 2 {
                return nums[index]
            }
        }
        return 0
    }
}
