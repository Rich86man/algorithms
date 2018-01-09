/*
 * [80] Remove Duplicates from Sorted Array II
 *
 * https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/description/
 *
 * algorithms
 * Medium (36.57%)
 * Total Accepted:    137.9K
 * Total Submissions: 377.1K
 * Testcase Example:  '[]'
 *
 * 
 * Follow up for "Remove Duplicates":
 * What if duplicates are allowed at most twice?
 * 
 * 
 * For example,
 * Given sorted array nums = [1,1,1,2,2,3],
 * 
 * 
 * Your function should return length = 5, with the first five elements of nums
 * being 1, 1, 2, 2 and 3. It doesn't matter what you leave beyond the new
 * length.
 * 
 */
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var i = nums.count - 3
        while i >= 0 {
            while nums.count > 2 && i >= 0 && nums[i] == nums[i + 1] && nums[i] == nums[i + 2] {
                nums.remove(at: i)
                i -= 1
            }
            i -= 1
        }
        return nums.count
    }
}
