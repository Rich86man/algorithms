/*
 * [62] Unique Paths
 *
 * https://leetcode.com/problems/unique-paths/description/
 *
 * algorithms
 * Medium (42.20%)
 * Total Accepted:    171.2K
 * Total Submissions: 405.6K
 * Testcase Example:  '1\n2'
 *
 * A robot is located at the top-left corner of a m x n grid (marked 'Start' in
 * the diagram below).
 * 
 * The robot can only move either down or right at any point in time. The robot
 * is trying to reach the bottom-right corner of the grid (marked 'Finish' in
 * the diagram below).
 * 
 * How many possible unique paths are there?
 * 
 * 
 * 
 * Above is a 3 x 7 grid. How many possible unique paths are there?
 * 
 * 
 * Note: m and n will be at most 100.
 */
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if n == 1 || m == 1 {return 1 }
        var dp = [[Int]](repeating: [Int](repeating: 0, count:m ), count: n)
        dp[0][0] = 1
        
        for i in 1..<n {
            dp[i][0] = 1
        }
        for j in 1..<m {
            dp[0][j] = 1
        }
        
        for i in 1..<n {
            for j in 1..<m {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }
        return dp[n - 1][m - 1]
    }
}
