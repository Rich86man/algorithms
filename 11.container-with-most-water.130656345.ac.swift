/*
 * [11] Container With Most Water
 *
 * https://leetcode.com/problems/container-with-most-water/description/
 *
 * algorithms
 * Medium (36.87%)
 * Total Accepted:    172.4K
 * Total Submissions: 467.5K
 * Testcase Example:  '[1,1]'
 *
 * Given n non-negative integers a1, a2, ..., an, where each represents a point
 * at coordinate (i, ai). n vertical lines are drawn such that the two
 * endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together
 * with x-axis forms a container, such that the container contains the most
 * water.
 * 
 * Note: You may not slant the container and n is at least 2.
 * 
 */
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        
        var maxVolume = 0
        var l = 0
        var r = height.count - 1
        
        while l < r {
            let bucketHeight = min(height[l], height[r])
            let bucketVolume = bucketHeight * (r - l)
            maxVolume = max(maxVolume, bucketVolume) 
            while height[l] <= bucketHeight && l < r { l += 1 }
            while height[r] <= bucketHeight && l < r { r -= 1 }
        }
        
        return maxVolume
    }
}
