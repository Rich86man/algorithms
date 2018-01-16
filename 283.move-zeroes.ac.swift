/*
 * [283] Move Zeroes
 *
 * https://leetcode.com/problems/move-zeroes/description/
 *
 * algorithms
 * Easy (51.02%)
 * Total Accepted:    246K
 * Total Submissions: 482.2K
 * Testcase Example:  '[0,1,0,3,12]'
 *
 * 
 * Given an array nums, write a function to move all 0's to the end of it while
 * maintaining the relative order of the non-zero elements.
 * 
 * 
 * 
 * For example, given nums  = [0, 1, 0, 3, 12], after calling your function,
 * nums should be [1, 3, 12, 0, 0].
 * 
 * 
 * 
 * Note:
 * 
 * You must do this in-place without making a copy of the array.
 * Minimize the total number of operations.
 * 
 * 
 * 
 * Credits:Special thanks to @jianchao.li.fighter for adding this problem and
 * creating all test cases.
 */
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        
        var index = 0
        var numSwaps = 0
        while index < (nums.count - numSwaps) {
            if nums[index] == 0 {
                nums.remove(at: index)
                nums.append(0)
                numSwaps += 1
            } else {
                index += 1    
            }
            
        }
    }
}
