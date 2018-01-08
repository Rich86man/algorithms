/*
 * [20] Valid Parentheses
 *
 * https://leetcode.com/problems/valid-parentheses/description/
 *
 * algorithms
 * Easy (33.77%)
 * Total Accepted:    281.4K
 * Total Submissions: 833.2K
 * Testcase Example:  '"["'
 *
 * Given a string containing just the characters '(', ')', '{', '}', '[' and
 * ']', determine if the input string is valid.
 * 
 * The brackets must close in the correct order, "()" and "()[]{}" are all
 * valid but "(]" and "([)]" are not.
 * 
 */
extension Array {
    mutating func push(_ value: Element) {
        insert(value, at: 0)
    }

    func peek() -> Element? {
        guard count > 0 else { return nil }
        return self[0]
    }

    @discardableResult
    mutating func pop() -> Element? {
        guard count > 0 else { return nil }
        let val = self[0]
        self.remove(at: 0)
        return val
    }
}

class Solution {
    func isValid(_ s: String) -> Bool {
        
        var array: [Character] = []
        
        for character in s.characters {
            switch character {
                case "(", "{", "[":
                    array.push(character)
                case ")":
                    if array.peek() != "(" { return false }
                    array.pop()
                case "}":
                    if array.peek() != "{" { return false }
                    array.pop()
                case "]":
                    if array.peek() != "[" { return false }
                    array.pop()
                default: break
            }
        }
        
        return array.count == 0
    }
}
