/*
 * [91] Decode Ways
 *
 * https://leetcode.com/problems/decode-ways/description/
 *
 * algorithms
 * Medium (20.14%)
 * Total Accepted:    153.6K
 * Total Submissions: 762.8K
 * Testcase Example:  '""'
 *
 * 
 * A message containing letters from A-Z is being encoded to numbers using the
 * following mapping:
 * 
 * 
 * 
 * 'A' -> 1
 * 'B' -> 2
 * ...
 * 'Z' -> 26
 * 
 * 
 * 
 * Given an encoded message containing digits, determine the total number of
 * ways to decode it.
 * 
 * 
 * 
 * For example,
 * Given encoded message "12",
 * it could be decoded as "AB" (1 2) or "L" (12).
 * 
 * 
 * 
 * The number of ways decoding "12" is 2.
 * 
 */
 class DPSolution {

    func numDecodings(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        guard s.count > 1 else { return s == "0" ? 0 : 1 }
        var dp: [Int] = [Int](repeating: 0, count: s.count + 1)
        dp[0] = 1
        dp[1] = s[s.startIndex] == "0" ? 0 : 1

        for index in 2...s.count {
            let firstDigit = Int(String(s[s.index(s.startIndex, offsetBy: index - 2)]))!
            let secondDigit = Int(String(s[s.index(s.startIndex, offsetBy: index - 1)]))!
            let total = firstDigit * 10 + secondDigit
            if firstDigit > 0 && total % 10 != 0 {
                dp[index] += dp[index - 2]
            }

            if firstDigit > 0 && total > 0 && total <= 26 {
                dp[index] += dp[index - 1]
            }
        }
        return dp[s.count]
    }
}

print(DPSolution().numDecodings("101") == 2)


class MemoSolution {
    var memo = [Int: Int]()

    func numDecodings(_ s: String, _ index: Int = 0) -> Int {
        guard memo[index] == nil else { return memo[index]! }
        guard s.count > 0 else { return 0 }
        guard index < s.count else { return 1 }

        let firstDigit = Int(String(s[s.index(s.startIndex, offsetBy: index)]))!

        guard index < s.count - 1 else { return firstDigit > 0 ? 1 : 0}

        let number = Int(s[s.index(s.startIndex, offsetBy: index)...s.index(s.startIndex, offsetBy: index + 1)])!
        memo[index] = (firstDigit > 0 && number > 0 && number <= 26 ? numDecodings(s, index + 2) : 0) +
                (firstDigit > 0 && number % 10 != 0 ? numDecodings(s, index + 1) : 0)
        return memo[index]!

        // dp: [[Int]] = Array(repeating: Array(repeating: 0, count))

    }
}

class Solution {

    func numDecodings(_ s: String) -> Int {
        return DPSolution().numDecodings(s)
    }
}