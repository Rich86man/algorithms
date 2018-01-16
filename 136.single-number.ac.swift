/*
 * [136] Single Number
 *
 * https://leetcode.com/problems/single-number/description/
 *
 * algorithms
 * Easy (55.10%)
 * Total Accepted:    263K
 * Total Submissions: 477.3K
 * Testcase Example:  '[1]'
 *
 * Given an array of integers, every element appears twice except for one. Find
 * that single one.
 * 
 * 
 * Note:
 * Your algorithm should have a linear runtime complexity. Could you implement
 * it without using extra memory?
 * 
 */
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
    var cache: [Int: Int] = [:]
    nums.forEach({ cache[$0] = (cache[$0] ?? 0) + 1 })
    return cache.flatMap({ $1 == 1 ? $0 : nil }).last!

}

}
