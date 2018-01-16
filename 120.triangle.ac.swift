/*
 * [120] Triangle
 *
 * https://leetcode.com/problems/triangle/description/
 *
 * algorithms
 * Medium (34.60%)
 * Total Accepted:    123.4K
 * Total Submissions: 356.6K
 * Testcase Example:  '[[-10]]'
 *
 * Given a triangle, find the minimum path sum from top to bottom. Each step
 * you may move to adjacent numbers on the row below.
 * 
 * 
 * For example, given the following triangle
 * 
 * [
 * ⁠    [2],
 * ⁠   [3,4],
 * ⁠  [6,5,7],
 * ⁠ [4,1,8,3]
 * ]
 * 
 * 
 * 
 * The minimum path sum from top to bottom is 11 (i.e., 2 + 3 + 5 + 1 = 11).
 * 
 * 
 * 
 * Note:
 * Bonus point if you are able to do this using only O(n) extra space, where n
 * is the total number of rows in the triangle.
 * 
 */
class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0 else { return 0 }
        var dp = [[Int]]()
        dp.append(triangle[0])
        // dp[0][0] = triangle[0][0]
        
        for level in 1..<triangle.count {
            dp.append([Int](repeating: Int.max, count: level + 1))
            let first = dp[level - 1].first! + triangle[level].first!
            let last = dp[level - 1].last! + triangle[level].last!
            dp[level][0] = first
            dp[level][level] = last
            if level == 1 { continue }

            for index in 1..<level {
                dp[level][index] = min(dp[level - 1][index - 1], dp[level - 1][index])
                dp[level][index] +=  triangle[level][index]   
            }
            
        }
        return dp[triangle.count - 1].sorted().first!
        
    }
}
