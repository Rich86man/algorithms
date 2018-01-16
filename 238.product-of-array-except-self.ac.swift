/*
 * [238] Product of Array Except Self
 *
 * https://leetcode.com/problems/product-of-array-except-self/description/
 *
 * algorithms
 * Medium (50.06%)
 * Total Accepted:    130.1K
 * Total Submissions: 260K
 * Testcase Example:  '[0,0]'
 *
 * 
 * Given an array of n integers where n > 1, nums, return an array output such
 * that output[i] is equal to the product of all the elements of nums except
 * nums[i].
 * 
 * Solve it without division and in O(n).
 * 
 * For example, given [1,2,3,4], return [24,12,8,6].
 * 
 * Follow up:
 * Could you solve it with constant space complexity? (Note: The output array
 * does not count as extra space for the purpose of space complexity analysis.)
 */
class Solution {
    // nums = [1,2,3,4]
    func productExceptSelf(_ nums: [Int]) -> [Int] {
            
        var prod: [Int] = []
        var temp: Int = 1
        
        for index in 0..<nums.count {
            prod.append(temp)
            temp *= nums[index]
        }
        // prod = [1, 1, 2, 6]
        
        temp = 1 
            
        for index in (0..<nums.count).reversed() {
            prod[index] *= temp
            temp *= nums[index]
        }
        
        // prod = [1, 1, 2, 6]
        // i = 3; prod = [1, 1, 2, 6]; temp = 4
        // i = 2; prod = [1, 1, 8, 6]; temp = 12
        // i = 1; prod = [1, 12, 8, 6]; temp = 24
        // i = 0; prod = [24, 12, 8, 6]; temp = 24
        
        return prod
    }
}
