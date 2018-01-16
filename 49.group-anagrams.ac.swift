/*
 * [49] Group Anagrams
 *
 * https://leetcode.com/problems/group-anagrams/description/
 *
 * algorithms
 * Medium (37.02%)
 * Total Accepted:    173.6K
 * Total Submissions: 469K
 * Testcase Example:  '["eat","tea","tan","ate","nat","bat"]'
 *
 * Given an array of strings, group anagrams together.
 * 
 * 
 * For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"], 
 * Return:
 * 
 * [
 * ⁠ ["ate", "eat","tea"],
 * ⁠ ["nat","tan"],
 * ⁠ ["bat"]
 * ]
 * 
 * Note: All inputs will be in lower-case.
 */
class Solution {
    
    func groupAnagrams(_ strs: [String]) -> [[String]] { 

        guard strs.count > 0 else { return [strs] }
        

        var cache = [String: [String]]()    
        for string in strs {
            let s = String(string.sorted())
            cache[s, default: [String]()].append(string)
        }
        var r = [[String]]()
        cache.values.forEach{ r.append( $0 ) }
        return r
    }

}
