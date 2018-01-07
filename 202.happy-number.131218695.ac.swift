/*
 * [202] Happy Number
 *
 * https://leetcode.com/problems/happy-number/description/
 *
 * algorithms
 * Easy (41.20%)
 * Total Accepted:    146.4K
 * Total Submissions: 355.4K
 * Testcase Example:  '1'
 *
 * Write an algorithm to determine if a number is "happy".
 * 
 * A happy number is a number defined by the following process: Starting with
 * any positive integer, replace the number by the sum of the squares of its
 * digits, and repeat the process until the number equals 1 (where it will
 * stay), or it loops endlessly in a cycle which does not include 1. Those
 * numbers for which this process ends in 1 are happy numbers.
 * 
 * Example: 19 is a happy number
 * 
 * 
 * 12 + 92 = 82
 * 82 + 22 = 68
 * 62 + 82 = 100
 * 12 + 02 + 02 = 1
 * 
 * 
 * Credits:Special thanks to @mithmatt and @ts for adding this problem and
 * creating all test cases.
 */
class Solution {
    func isHappy(_ n: Int) -> Bool {
        var cache: [Int: Bool] = [:]
        return _isHappy(n,&cache)        
    }
    
    func _isHappy(_ n: Int, _ cache: inout [Int: Bool]) -> Bool {
        guard cache[n] == nil else { return false }
        cache[n] = true
        var temp = 0
        var n = n
        
        while n > 0 {
            let tail = n % 10
            temp += Int(tail * tail)
            n = n / 10
        }
        if temp == 1 {
            return true
        }
        return _isHappy(temp, &cache)
    }
}
