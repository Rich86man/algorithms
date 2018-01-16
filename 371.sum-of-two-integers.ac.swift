/*
 * [371] Sum of Two Integers
 *
 * https://leetcode.com/problems/sum-of-two-integers/description/
 *
 * algorithms
 * Easy (51.11%)
 * Total Accepted:    86.8K
 * Total Submissions: 169.9K
 * Testcase Example:  '1\n2'
 *
 * Calculate the sum of two integers a and b, but you are not allowed to use
 * the operator + and -.
 * 
 * Example:
 * Given a = 1 and b = 2, return 3.
 * 
 * 
 * Credits:Special thanks to @fujiaozhu for adding this problem and creating
 * all test cases.
 */
class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : getSum(a ^ b, (a&b) << 1)
    
    }
}
