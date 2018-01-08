/*
 * [217] Contains Duplicate
 *
 * https://leetcode.com/problems/contains-duplicate/description/
 *
 * algorithms
 * Easy (46.56%)
 * Total Accepted:    190K
 * Total Submissions: 408.1K
 * Testcase Example:  '[]'
 *
 * 
 * Given an array of integers, find if the array contains any duplicates. Your
 * function should return true if any value appears at least twice in the
 * array, and it should return false if every element is distinct.
 * 
 */
class Solution {
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var cache = [Int: Int]()
        for num in nums {
            guard cache[num] == nil else { return true }
            cache[num] = 1
        }

        return false
    }
}
