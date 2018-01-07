/*
 * [53] Maximum Subarray
 *
 * https://leetcode.com/problems/maximum-subarray/description/
 *
 * algorithms
 * Easy (40.07%)
 * Total Accepted:    267K
 * Total Submissions: 666.2K
 * Testcase Example:  '[-2,1,-3,4,-1,2,1,-5,4]'
 *
 * 
 * Find the contiguous subarray within an array (containing at least one
 * number) which has the largest sum.
 * 
 * 
 * For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
 * the contiguous subarray [4,-1,2,1] has the largest sum = 6.
 * 
 * 
 * click to show more practice.
 * 
 * More practice:
 * 
 * If you have figured out the O(n) solution, try coding another solution using
 * the divide and conquer approach, which is more subtle.
 * 
 */
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        
        var maxSum = nums[0]
        var runningSum = nums[0]
        
        for index in 1..<nums.count {
            if runningSum < 0 { 
                runningSum = nums[index]
            } else {
                runningSum += nums[index]
            }
            maxSum = max(maxSum, runningSum)
        }
        
        return maxSum
    }
}
