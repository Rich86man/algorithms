/*
 * [219] Contains Duplicate II
 *
 * https://leetcode.com/problems/contains-duplicate-ii/description/
 *
 * algorithms
 * Easy (32.70%)
 * Total Accepted:    131.5K
 * Total Submissions: 402K
 * Testcase Example:  '[]\n0'
 *
 * 
 * Given an array of integers and an integer k, find out whether there are two
 * distinct indices i and j in the array such that nums[i] = nums[j] and the
 * absolute difference between i and j is at most k.
 * 
 */
class Solution {

    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        guard nums.count > 0 else { return false }
        guard k > 0 else { return false }
        var cache = [Int: Int]()

        for index in 0..<nums.count {

            if let lastSeen = cache[nums[index]],  abs(lastSeen - index) <= k {
                return true
            }
            cache[nums[index]] = index
        }
        
        return false
    }
}
