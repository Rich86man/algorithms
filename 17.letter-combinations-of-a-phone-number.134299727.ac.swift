/*
 * [17] Letter Combinations of a Phone Number
 *
 * https://leetcode.com/problems/letter-combinations-of-a-phone-number/description/
 *
 * algorithms
 * Medium (35.68%)
 * Total Accepted:    202.4K
 * Total Submissions: 567.4K
 * Testcase Example:  '""'
 *
 * Given a digit string, return all possible letter combinations that the
 * number could represent.
 * 
 * 
 * 
 * A mapping of digit to letters (just like on the telephone buttons) is given
 * below.
 * 
 * 
 * 
 * Input:Digit string "23"
 * Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 * 
 * 
 * 
 * Note:
 * Although the above answer is in lexicographical order, your answer could be
 * in any order you want.
 * 
 */
class Solution {

    let dict = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
    var combinations = [String]()
    
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else { return [] }
        _letterCombinations("", 0, digits)
        return combinations        
    }
    
    func _letterCombinations(_ builder: String,_ index: Int,_ digits: String) {
        guard index < digits.count else {
            combinations.append(builder)
            return
        }
        let phoneKey: Int = Int(String())!
        for char in dict[phoneKey] {
            _letterCombinations(builder + String(char), index + 1, digits)
        }
    }
}

class Stack<T> {
    
    private var a: [T] = []
    
    var isEmpty: Bool {
        return a.isEmpty
    }
    
    func push(_ value: T) {
        a.append(value)
    }
    
    func pop() -> T? {
        return a.popLast()
    }
    
    func toArray() -> [T] {
        return a
    }
}

