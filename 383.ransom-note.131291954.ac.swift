/*
 * [383] Ransom Note
 *
 * https://leetcode.com/problems/ransom-note/description/
 *
 * algorithms
 * Easy (47.59%)
 * Total Accepted:    70.5K
 * Total Submissions: 148.2K
 * Testcase Example:  '"a"\n"b"'
 *
 * 
 * Given an arbitrary ransom note string and another string containing letters
 * from all the magazines, write a function that will return true if the
 * ransom 
 * note can be constructed from the magazines ; otherwise, it will return
 * false. 
 * 
 * 
 * Each letter in the magazine string can only be used once in your ransom
 * note.
 * 
 * 
 * Note:
 * You may assume that both strings contain only lowercase letters.
 * 
 * 
 * 
 * canConstruct("a", "b") -> false
 * canConstruct("aa", "ab") -> false
 * canConstruct("aa", "aab") -> true
 * 
 * 
 */
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        
        var magazineCache: [Character: Int] = [:]
        
        for character in magazine {
            magazineCache[character, default: 0] += 1
        }
        
        for character in ransomNote {
            if magazineCache[character, default: -1] > 0 {
                magazineCache[character]! -= 1
            } else {
                return false
            }
        }
        
        return true   
    }
}
