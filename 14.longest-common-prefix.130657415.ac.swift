/*
 * [14] Longest Common Prefix
 *
 * https://leetcode.com/problems/longest-common-prefix/description/
 *
 * algorithms
 * Easy (31.57%)
 * Total Accepted:    233.6K
 * Total Submissions: 739.9K
 * Testcase Example:  '[]'
 *
 * Write a function to find the longest common prefix string amongst an array
 * of strings.
 * 
 */
class Solution {

    class func prefix(_ a: String, _ b: String) -> String {

        for index in 0..<min(a.count, b.count) {
            guard a[a.index(a.startIndex, offsetBy: index)] == b[b.index(b.startIndex, offsetBy: index)]
                else {
                    return String(a[..<a.index(a.startIndex, offsetBy: index)])
            }
        }

        return a.count > b.count ? b : a
    }

    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }
        guard strs.count > 1 else { return strs.first! }
        var longest = strs.first!
        strs.forEach { (s) in
            let word = Solution.prefix(longest, s)
            longest = word
        }
        return longest
    }
}
