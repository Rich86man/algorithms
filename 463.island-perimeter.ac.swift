/*
 * [463] Island Perimeter
 *
 * https://leetcode.com/problems/island-perimeter/description/
 *
 * algorithms
 * Easy (57.63%)
 * Total Accepted:    66.8K
 * Total Submissions: 116K
 * Testcase Example:  '[[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]'
 *
 * You are given a map in form of a two-dimensional integer grid where 1
 * represents land and 0 represents water. Grid cells are connected
 * horizontally/vertically (not diagonally). The grid is completely surrounded
 * by water, and there is exactly one island (i.e., one or more connected land
 * cells). The island doesn't have "lakes" (water inside that isn't connected
 * to the water around the island). One cell is a square with side length 1.
 * The grid is rectangular, width and height don't exceed 100. Determine the
 * perimeter of the island.
 * 
 * Example:
 * 
 * [[0,1,0,0],
 * ⁠[1,1,1,0],
 * ⁠[0,1,0,0],
 * ⁠[1,1,0,0]]
 * 
 * Answer: 16
 * Explanation: The perimeter is the 16 yellow stripes in the image below:
 * 
 * 
 * 
 */
class Solution {
    
    var visited = Set<String>()
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        
        let land: (row: Int, column: Int) = findIsland(grid)
        
        return perimeter(grid, land.row, land.column)
    }
    
    func isWater(_ grid: [[Int]], _ row: Int,_ column: Int) -> Bool {
        guard row >= 0, 
              row < grid.count,
              column >= 0,
              column < grid[row].count
        else { return true }
        return grid[row][column] == 0
    }
    func perimeter(_ grid: [[Int]], _ row: Int, _ column: Int) -> Int {
        guard grid[row][column] == 1 else { return 0 }
        guard visited.contains("\(row)-\(column)") == false else { return 0 }
        visited.insert("\(row)-\(column)")
        return (isWater(grid, row - 1, column) ? 1 : perimeter(grid, row - 1, column)) +
               (isWater(grid, row + 1, column) ? 1 : perimeter(grid, row + 1, column)) +
               (isWater(grid, row, column - 1) ? 1 : perimeter(grid, row, column - 1)) +
               (isWater(grid, row, column + 1) ? 1 : perimeter(grid, row, column + 1))
    }
    
    func findIsland(_ grid: [[Int]]) -> (Int, Int) {
        
        for row in grid.indices {
            for column in grid[row].indices {
                if grid[row][column] == 1 {
                    return (row, column)
                }
            }
        }
        return (0,0)
    }
}
