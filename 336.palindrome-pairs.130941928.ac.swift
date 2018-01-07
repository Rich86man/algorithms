/*
 * [336] Palindrome Pairs
 *
 * https://leetcode.com/problems/palindrome-pairs/description/
 *
 * algorithms
 * Hard (26.85%)
 * Total Accepted:    33.8K
 * Total Submissions: 125.8K
 * Testcase Example:  '["abcd","dcba","lls","s","sssll"]'
 *
 * 
 * ⁠   Given a list of unique words, find all pairs of distinct indices (i, j)
 * in the given list, so that the concatenation of the two words, i.e. words[i]
 * + words[j] is a palindrome.
 * 
 * 
 * 
 * ⁠   Example 1:
 * ⁠   Given words = ["bat", "tab", "cat"]
 * ⁠   Return [[0, 1], [1, 0]]
 * ⁠   The palindromes are ["battab", "tabbat"]
 * 
 * 
 * ⁠   Example 2:
 * ⁠   Given words = ["abcd", "dcba", "lls", "s", "sssll"]
 * ⁠   Return [[0, 1], [1, 0], [3, 2], [2, 4]]
 * ⁠   The palindromes are ["dcbaabcd", "abcddcba", "slls", "llssssll"]
 * 
 * 
 * Credits:Special thanks to @dietpepsi for adding this problem and creating
 * all test cases.
 */
class Solution {

    var cache: [String: Bool] = [:]

    func palindromePairs(_ words: [String]) -> [[Int]] {

        var indices: [[Int]] = []

        var wordsIndex: [String: Int] = [:]
        for itr in 0..<words.count {
            wordsIndex[words[itr]] = itr
        }

        for wordItr in 0..<words.count {
            let word = words[wordItr]
            for letterItr in 0...words[wordItr].count {

                let prefix = word[word.startIndex..<word.index(word.startIndex, offsetBy: letterItr)]
                let suffix = word[word.index(word.startIndex, offsetBy: letterItr)..<word.endIndex]

                if isPalidrome(String(prefix)), let reversedIndex = wordsIndex[String(suffix.reversed())], reversedIndex != wordItr  {
                    indices.append([reversedIndex, wordItr])
                }

                if suffix.count > 0, isPalidrome(String(suffix)), let reversedIndex = wordsIndex[String(prefix.reversed())], reversedIndex != wordItr  {
                    indices.append([wordItr,reversedIndex])
                }

            }
        }

        return indices
    }

    func isPalidrome(_ string: String) -> Bool {

        var start = 0
        var end = string.count - 1
        while start < end {
            let left = string[string.index(string.startIndex, offsetBy: start)]
            let right = string[string.index(string.startIndex, offsetBy: end)]
            if left != right {
                return false
            }
            start += 1
            end -= 1
        }
        return true
    }
}

