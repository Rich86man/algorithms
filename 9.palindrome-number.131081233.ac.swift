/*
 * [9] Palindrome Number
 *
 * https://leetcode.com/problems/palindrome-number/description/
 *
 * algorithms
 * Easy (35.64%)
 * Total Accepted:    283.4K
 * Total Submissions: 795.3K
 * Testcase Example:  '-2147483648'
 *
 * Determine whether an integer is a palindrome. Do this without extra space.
 * 
 * click to show spoilers.
 * 
 * Some hints:
 * 
 * Could negative integers be palindromes? (ie, -1)
 * 
 * If you are thinking of converting the integer to string, note the
 * restriction of using extra space.
 * 
 * You could also try reversing an integer. However, if you have solved the
 * problem "Reverse Integer", you know that the reversed integer might
 * overflow. How would you handle such case?
 * 
 * There is a more generic way of solving this problem.
 * 
 * 
 */
class Solution {
    
    func backward(_ number: Int) -> Int {
        
        var num = number
        var result = 0
        while (num > 0) {
        
            let tail = (num % 10)
            result = (result * 10) + tail
            num = num / 10
        }
        return result
    }
    
    func isPalindrome(_ x: Int) -> Bool {
    
        return x - backward(x) == 0    
    }
}
