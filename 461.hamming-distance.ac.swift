/*
 * [461] Hamming Distance
 *
 * https://leetcode.com/problems/hamming-distance/description/
 *
 * algorithms
 * Easy (69.62%)
 * Total Accepted:    124.7K
 * Total Submissions: 179.2K
 * Testcase Example:  '1\n4'
 *
 * The Hamming distance between two integers is the number of positions at
 * which the corresponding bits are different.
 * 
 * Given two integers x and y, calculate the Hamming distance.
 * 
 * Note:
 * 0 ≤ x, y < 231.
 * 
 * 
 * Example:
 * 
 * Input: x = 1, y = 4
 * 
 * Output: 2
 * 
 * Explanation:
 * 1   (0 0 0 1)
 * 4   (0 1 0 0)
 * ⁠      ↑   ↑
 * 
 * The above arrows point to positions where the corresponding bits are
 * different.
 * 
 * 
 */
class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        
        var x = x
        var y = y
        var total = 0
        while (x > 0 || y > 0) {
            
            let xBit = x % 2
            let yBit = y % 2
        
            total += abs(xBit - yBit)
            x /= 2
            y /= 2
        }
        
        return total
    }
}
