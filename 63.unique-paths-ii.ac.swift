/*
 * [63] Unique Paths II
 *
 * https://leetcode.com/problems/unique-paths-ii/description/
 *
 * algorithms
 * Medium (32.05%)
 * Total Accepted:    123.3K
 * Total Submissions: 384.6K
 * Testcase Example:  '[[0]]'
 *
 * Follow up for "Unique Paths":
 * 
 * Now consider if some obstacles are added to the grids. How many unique paths
 * would there be?
 * 
 * An obstacle and empty space is marked as 1 and 0 respectively in the grid.
 * 
 * For example,
 * There is one obstacle in the middle of a 3x3 grid as illustrated below.
 * 
 * [
 * ⁠ [0,0,0],
 * ⁠ [0,1,0],
 * ⁠ [0,0,0]
 * ]
 * 
 * The total number of unique paths is 2.
 * 
 * Note: m and n will be at most 100.
 */
class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        guard obstacleGrid.count > 0 else { return 0 }
        let n = obstacleGrid.count
        let m = obstacleGrid[0].count
        guard obstacleGrid[0][0] == 0 else { return 0 }
        guard obstacleGrid[n - 1][m - 1] == 0 else { return 0 }
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
        dp[0][0] = 1
        for i in 1..<n {
            dp[i][0] = obstacleGrid[i][0] == 0 ? dp[i - 1][0] : 0
        }
        for j in 1..<m {
            dp[0][j] = obstacleGrid[0][j] == 0 ? dp[0][j - 1] : 0
        }
        
        for i in 1..<n {
            for j in 1..<m {
                if obstacleGrid[i][j] == 0 {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]    
                }
            }
        }
        dp.forEach {print($0)}
        return dp[n - 1][m - 1]
    }
}
