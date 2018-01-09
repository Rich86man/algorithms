/*
 * [64] Minimum Path Sum
 *
 * https://leetcode.com/problems/minimum-path-sum/description/
 *
 * algorithms
 * Medium (39.74%)
 * Total Accepted:    134.2K
 * Total Submissions: 337.6K
 * Testcase Example:  '[[1,3,1],[1,5,1],[4,2,1]]'
 *
 * Given a m x n grid filled with non-negative numbers, find a path from top
 * left to bottom right which minimizes the sum of all numbers along its path.
 * 
 * Note: You can only move either down or right at any point in time.
 * 
 * Example 1:
 * 
 * [[1,3,1],
 * ⁠[1,5,1],
 * ⁠[4,2,1]]
 * 
 * Given the above grid map, return 7. Because the path 1→3→1→1→1 minimizes the
 * sum.
 * 
 */
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {

        guard grid.count > 0 else { return 0 }
        
        let n = grid.count
        let m = grid[0].count
        var dp: [[Int]] = [[Int]](repeating: [Int](repeating: Int.max, count: m), count: n) 
        
        dp[0][0] = grid[0][0]
        for i in 1..<n {
            dp[i][0] = dp[i - 1][0] + grid[i][0]
        } 
        for j in 1..<m {
            dp[0][j] = dp[0][j - 1] + grid[0][j]
        } 
        for i in 1..<n {
            for j in 1..<m {
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
            }
        }
        return dp[n - 1][m - 1]
    }
}
