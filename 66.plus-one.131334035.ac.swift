/*
 * [66] Plus One
 *
 * https://leetcode.com/problems/plus-one/description/
 *
 * algorithms
 * Easy (39.30%)
 * Total Accepted:    209.6K
 * Total Submissions: 533.2K
 * Testcase Example:  '[0]'
 *
 * Given a non-negative integer represented as a non-empty array of digits,
 * plus one to the integer.
 * 
 * You may assume the integer do not contain any leading zero, except the
 * number 0 itself.
 * 
 * The digits are stored such that the most significant digit is at the head of
 * the list.
 */
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        var index = result.count - 1
        while index >= 0 && result[index] == 9 {
            result[index] = 0
            index -= 1
        }
        if index < 0 {
            result.insert(0, at: 0)
            index += 1
        }
        result[index] += 1
        return result
    }
}
