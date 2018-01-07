/*
 * [269] Alien Dictionary
 *
 * https://leetcode.com/problems/alien-dictionary/description/
 *
 * algorithms
 * Hard (25.69%)
 * Total Accepted:    35.4K
 * Total Submissions: 137.7K
 * Testcase Example:  '["wrt","wrf","er","ett","rftt"]'
 *
 * 
 * There is a new alien language which uses the latin alphabet. 
 * However, the order among letters are unknown to you. 
 * You receive a list of non-empty words from the dictionary, where words are
 * sorted lexicographically by the rules of this new language.
 * Derive the order of letters in this language.
 * 
 * 
 * 
 * Example 1:
 * Given the following words in dictionary,
 * 
 * [
 * ⁠ "wrt",
 * ⁠ "wrf",
 * ⁠ "er",
 * ⁠ "ett",
 * ⁠ "rftt"
 * ]
 * 
 * 
 * 
 * The correct order is: "wertf".
 * 
 * 
 * Example 2:
 * Given the following words in dictionary,
 * 
 * [
 * ⁠ "z",
 * ⁠ "x"
 * ]
 * 
 * 
 * 
 * The correct order is: "zx".
 * 
 * 
 * Example 3:
 * Given the following words in dictionary,
 * 
 * [
 * ⁠ "z",
 * ⁠ "x",
 * ⁠ "z"
 * ]
 * 
 * 
 * 
 * The order is invalid, so return "".
 * 
 * Note:
 * 
 * You may assume all letters are in lowercase.
 * You may assume that if a is a prefix of b, then a must appear before b in
 * the given dictionary.
 * If the order is invalid, return an empty string.
 * There may be multiple valid order of letters, return any one of them is
 * fine.
 * 
 * 
 */
extension String {

    subscript(_ index: Int) -> Character? {
        guard index < self.count else { return nil }
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

class Solution {
    func alienOrder(_ words: [String]) -> String {

        var precedence: [Character: Set<Character>] = [:]
        var degree: [Character: Int] = [:]
        for char in words.joined() {
            degree[char] = 0
        }

        words.eachPair { (top , bottom) in

            let length = min(top.count, bottom.count)
            var charIndex = 0
            while charIndex < length && top[charIndex] == bottom[charIndex]  {
                charIndex += 1
            }

            if top[charIndex] != bottom[charIndex] {
                if let topChar = top[charIndex], let bottomChar = bottom[charIndex] {

                    var p = precedence[topChar, default: Set<Character>()]
                    if !p.contains(bottomChar) {
                        p.insert(bottomChar)
                        precedence[topChar] = p
                        degree[bottomChar, default: 0] += 1
                    }
                }
            }
        }

        var stack = Stack<Character>()

        for char in degree.keys {
            if degree[char] == 0 {
                stack.push(char)
            }
        }
        var result = ""
        while stack.count > 0 {
            let currentChar = stack.pop()!
            result.append(currentChar)

            let lowerChars =  precedence[currentChar, default: Set<Character>()]
            for char in lowerChars {
                degree[char, default: 1] -= 1
                if degree[char] == 0 {
                    stack.push(char)
                }
            }
        }

        return result.count == degree.count ? result : ""
    }
}

struct Stack<T> {
    fileprivate var array: [T] = []

    var count: Int {
        return array.count
    }

    var top: T? {
        return array.last
    }

    mutating func push(_ val: T) {
        array.append(val)
    }

    mutating func pop() -> T? {
        return array.popLast()
    }
}

extension Array {
    func eachPair(_ block: ((Element, Element) -> Void)) {
        guard self.count > 1 else { return }
        var x = 0
        var y = 1
        while y < self.count {
            block(self[x], self[y])
            x += 1
            y += 1
        }

    }
}

