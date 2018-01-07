/*
 * [200] Number of Islands
 *
 * https://leetcode.com/problems/number-of-islands/description/
 *
 * algorithms
 * Medium (35.94%)
 * Total Accepted:    147.7K
 * Total Submissions: 411K
 * Testcase Example:  '[["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]'
 *
 * Given a 2d grid map of '1's (land) and '0's (water), count the number of
 * islands. An island is surrounded by water and is formed by connecting
 * adjacent lands horizontally or vertically. You may assume all four edges of
 * the grid are all surrounded by water.
 * 
 * Example 1:
 * 11110110101100000000
 * Answer: 1
 * Example 2:
 * 11000110000010000011
 * Answer: 3
 * 
 * Credits:Special thanks to @mithmatt for adding this problem and creating all
 * test cases.
 */
class Solution {
    
    var visited: [String: Bool] = [:]
    var grid: [[Character]]!
    func numIslands(_ grid: [[Character]]) -> Int {
        self.grid = grid
        var num = 0
        for row in 0..<grid.count {
            for column in 0..<grid[row].count {
                if search(row, column) > 0 {
                    num += 1 
                }
            }
        }
        return num
    }
    
    func search(_ row: Int,_ column: Int) -> Int {
        guard row >= 0 && 
              row < self.grid.count && 
              column >= 0 && 
              column < self.grid[row].count 
        else { return 0 }
        
        guard visited["\(row)-\(column)"] == nil else { return 0 }        
        visited["\(row)-\(column)"] = true
        guard self.grid[row][column] == "1" else { return 0 }
        
        return 1 + search(row - 1, column) + search(row + 1, column) + 
               search(row, column - 1) + search(row, column + 1)
        
    }
}
