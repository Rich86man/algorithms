/*
 * [695] Max Area of Island
 *
 * https://leetcode.com/problems/max-area-of-island/description/
 *
 * algorithms
 * Easy (52.50%)
 * Total Accepted:    15.5K
 * Total Submissions: 29.5K
 * Testcase Example:  '[[1,1,0,0,0],[1,1,0,0,0],[0,0,0,1,1],[0,0,0,1,1]]'
 *
 * Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's
 * (representing land) connected 4-directionally (horizontal or vertical.)  You
 * may assume all four edges of the grid are surrounded by water.
 * 
 * Find the maximum area of an island in the given 2D array.
 * (If there is no island, the maximum area is 0.)
 * 
 * Example 1:
 * 
 * [[0,0,1,0,0,0,0,1,0,0,0,0,0],
 * ⁠[0,0,0,0,0,0,0,1,1,1,0,0,0],
 * ⁠[0,1,1,0,1,0,0,0,0,0,0,0,0],
 * ⁠[0,1,0,0,1,1,0,0,1,0,1,0,0],
 * ⁠[0,1,0,0,1,1,0,0,1,1,1,0,0],
 * ⁠[0,0,0,0,0,0,0,0,0,0,1,0,0],
 * ⁠[0,0,0,0,0,0,0,1,1,1,0,0,0],
 * ⁠[0,0,0,0,0,0,0,1,1,0,0,0,0]]
 * 
 * Given the above grid, return 6.
 * 
 * Note the answer is not 11, because the island must be connected
 * 4-directionally.
 * 
 * 
 * Example 2:
 * [[0,0,0,0,0,0,0,0]]
 * Given the above grid, return 0.
 * 
 * 
 * Note:
 * The length of each dimension in the given grid does not exceed 50.
 * 
 */
class Solution {
    var grid: [[Int]]!
    var visited = Set<String>()
    
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var maxArea = 0
        self.grid = grid
        for row in 0..<grid.count {
            for column in 0..<grid[row].count {
                maxArea = max(maxArea, area(row, column))
            }
        }
        return maxArea
    }
    
    func area(_ row: Int,_ column: Int) -> Int {
        
        guard row >= 0 &&
              row < self.grid.count &&
              column >= 0 &&
              column < self.grid[row].count 
        else { return 0 }
        
        guard visited.contains("\(row)-\(column)") == false 
        else { return 0 }
        visited.insert("\(row)-\(column)")
        guard self.grid[row][column] > 0 else { return 0 }
        
        return 1 + area(row - 1, column) +
               area(row + 1, column) +
               area(row, column - 1) +
               area(row, column + 1)
                
    }
}
