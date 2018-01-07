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
        var carry = 1
        for index in (-1..<digits.count).reversed() {
            print(index)
            if index == -1 {
                if carry == 1 {
                    result.insert(carry, at: 0)    
                }
                break
            }
            let total = result[index] + carry
            result[index] = total % 10
            carry = total / 10
            if carry == 0 {
                break
            }
        }
        return result
    }
}
