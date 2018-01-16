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

class DPSolution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.first ?? 0 }

        var dp: [Int] = [Int](repeating: 0, count: nums.count)
        dp[0] = nums[0]

        for index in 1..<nums.count {
            // take the last value, or start over
            dp[index] = max(dp[index - 1] + nums[index], nums[index])
        }
        return dp.sorted().last!
    }
}

class O1StorageSolution {

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


class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        return O1StorageSolution().maxSubArray(nums)
    }
}

