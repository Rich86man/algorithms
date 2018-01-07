/*
 * [7] Reverse Integer
 *
 * https://leetcode.com/problems/reverse-integer/description/
 *
 * algorithms
 * Easy (24.40%)
 * Total Accepted:    341.7K
 * Total Submissions: 1.4M
 * Testcase Example:  '123'
 *
 * Given a 32-bit signed integer, reverse digits of an integer.
 * 
 * Example 1:
 * 
 * Input: 123
 * Output:  321
 * 
 * 
 * 
 * Example 2:
 * 
 * Input: -123
 * Output: -321
 * 
 * 
 * 
 * Example 3:
 * 
 * Input: 120
 * Output: 21
 * 
 * 
 * 
 * Note:
 * Assume we are dealing with an environment which could only hold integers
 * within the 32-bit signed integer range. For the purpose of this problem,
 * assume that your function returns 0 when the reversed integer overflows.
 * 
 */
class Solution {
    func reverse(_ x: Int) -> Int {
        
        var temp: Int = 0
        var num = x
        while (num != 0) {
            let tail = num % 10
            temp = (temp * 10) + tail
            num = num / 10
        }
        return abs(temp) > Int32.max ? 0 : temp
    }
}
