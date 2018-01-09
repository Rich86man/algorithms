/*
 * [139] Word Break
 *
 * https://leetcode.com/problems/word-break/description/
 *
 * algorithms
 * Medium (31.00%)
 * Total Accepted:    188.3K
 * Total Submissions: 607.3K
 * Testcase Example:  '"leetcode"\n["leet","code"]'
 *
 * 
 * Given a non-empty string s and a dictionary wordDict containing a list of
 * non-empty words, determine if s can be segmented into a space-separated
 * sequence of one or more dictionary words. You may assume the dictionary does
 * not contain duplicate words.
 * 
 * 
 * For example, given
 * s = "leetcode",
 * dict = ["leet", "code"].
 * 
 * 
 * 
 * Return true because "leetcode" can be segmented as "leet code".
 * 
 * 
 * 
 * UPDATE (2017/1/4):
 * The wordDict parameter had been changed to a list of strings (instead of a
 * set of strings). Please reload the code definition to get the latest
 * changes.
 * 
 */
class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        guard s.count > 1 else { return wordDict.contains(s) }
        var dp = [Bool](repeating: false, count: s.count + 1)
        dp[0] = true
        var lastBreak = s.count
        for i in 1...s.count {
            for j in (0..<i).reversed() {
                if dp[j] {
                    var word = String(s[s.index(s.startIndex, offsetBy: j)..<s.index(s.startIndex, offsetBy: i)])
                    // print(word)
                    dp[i] = dp[i] || wordDict.contains(word)
                }
            }
        }
        // print(dp)
        return dp[s.count]
    }
}
