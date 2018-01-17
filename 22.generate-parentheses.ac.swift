/*
 * [22] Generate Parentheses
 *
 * https://leetcode.com/problems/generate-parentheses/description/
 *
 * algorithms
 * Medium (46.90%)
 * Total Accepted:    185.3K
 * Total Submissions: 395.1K
 * Testcase Example:  '3'
 *
 * 
 * Given n pairs of parentheses, write a function to generate all combinations
 * of well-formed parentheses.
 * 
 * 
 * 
 * For example, given n = 3, a solution set is:
 * 
 * 
 * [
 * ⁠ "((()))",
 * ⁠ "(()())",
 * ⁠ "(())()",
 * ⁠ "()(())",
 * ⁠ "()()()"
 * ]
 * 
 */
class Solution {
    
    func generateParenthesis(_ n: Int) -> [String] {
        var solutions: [String] = []
        _generateParenthesis("", n, n, &solutions)
        return solutions
    }
    
    func _generateParenthesis(_ str: String,_ l: Int,_ r: Int,_ solutions: inout [String]) {
        
        if l > r { return }
        
        if l > 0 {
            _generateParenthesis(str + "(", l - 1, r, &solutions)
        } 
        if r > 0 {
            _generateParenthesis(str + ")", l, r - 1, &solutions)
        }
        
        if l == 0 && r == 0 {
            solutions.append(str)
        }
    }
}
