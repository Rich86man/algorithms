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
class Solution {
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
