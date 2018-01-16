/*
 * [1] Two Sum
 *
 * https://leetcode.com/problems/two-sum/description/
 *
 * algorithms
 * Easy (36.69%)
 * Total Accepted:    750.2K
 * Total Submissions: 2M
 * Testcase Example:  '[3,2,4]\n6'
 *
 * Given an array of integers, return indices of the two numbers such that they
 * add up to a specific target.
 * 
 * You may assume that each input would have exactly one solution, and you may
 * not use the same element twice.
 * 
 * 
 * Example:
 * 
 * Given nums = [2, 7, 11, 15], target = 9,
 * 
 * Because nums[0] + nums[1] = 2 + 7 = 9,
 * return [0, 1].
 * 
 * 
 */
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var table: [Int: Int] = [:]

        for index in 0..<nums.count {
            let compliment = target - nums[index]
            if let existing = table[compliment] {
                return [existing, index]
            }
            table[nums[index]] = index
        }

        return [0,10]
    }
}
