/*
 * [198] House Robber
 *
 * https://leetcode.com/problems/house-robber/description/
 *
 * algorithms
 * Easy (39.62%)
 * Total Accepted:    174.1K
 * Total Submissions: 439.3K
 * Testcase Example:  '[]'
 *
 * You are a professional robber planning to rob houses along a street. Each
 * house has a certain amount of money stashed, the only constraint stopping
 * you from robbing each of them is that adjacent houses have security system
 * connected and it will automatically contact the police if two adjacent
 * houses were broken into on the same night.
 * 
 * Given a list of non-negative integers representing the amount of money of
 * each house, determine the maximum amount of money you can rob tonight
 * without alerting the police.
 * 
 * Credits:Special thanks to @ifanchu for adding this problem and creating all
 * test cases. Also thanks to @ts for adding additional test cases.
 */
class MemoSolution {
    var memo: [Int: Int] = [:]
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        guard nums.count > 1 else { return nums.first! }
        return _rob(nums, -1)
    }

    func _rob(_ houses: [Int],_ index: Int) -> Int {

        guard index < houses.count else { return 0 }

        if let m = memo[index] { return m }

        let moneyA = index + 1 < houses.count ? houses[index + 1] : 0
        let moneyB = index + 2 < houses.count ? houses[index + 2] : 0
        // print(index, moneyA, moneyB)
        memo[index] = max(moneyA + _rob(houses, index + 2), moneyB + _rob(houses, index + 3))
        return memo[index]!
    }
}

class DPSolution {

    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        guard nums.count > 1 else { return nums.first! }

        var dp: [Int] = [Int](repeating: 0, count: nums.count + 1)
        dp[0] = 0
        dp[1] = nums[0]
        dp[2] = max(dp[1], dp[0] + nums[1])

        guard nums.count > 2 else { return dp[nums.count] }

        for i in 3...nums.count {
            dp[i] = max(dp[i - 1], dp[i - 2] + nums[i - 1])
        }
        return dp[nums.count]
    }
}

class Solution {
    func rob(_ nums: [Int]) -> Int {
        return DPSolution().rob(nums)
    }
}
print("houses : \([100,2,41,23,412,22,1,223])")
print(DPSolution().rob([100,2]))
print(MemoSolution().rob([100,2]))