/*
 * [36] Valid Sudoku
 *
 * https://leetcode.com/problems/valid-sudoku/description/
 *
 * algorithms
 * Medium (36.85%)
 * Total Accepted:    139.3K
 * Total Submissions: 378.1K
 * Testcase Example:  '[[".","8","7","6","5","4","3","2","1"],["2",".",".",".",".",".",".",".","."],["3",".",".",".",".",".",".",".","."],["4",".",".",".",".",".",".",".","."],["5",".",".",".",".",".",".",".","."],["6",".",".",".",".",".",".",".","."],["7",".",".",".",".",".",".",".","."],["8",".",".",".",".",".",".",".","."],["9",".",".",".",".",".",".",".","."]]'
 *
 * Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules.
 * 
 * The Sudoku board could be partially filled, where empty cells are filled
 * with the character '.'.
 * 
 * 
 * 
 * A partially filled sudoku which is valid.
 * 
 * 
 * Note:
 * A valid Sudoku board (partially filled) is not necessarily solvable. Only
 * the filled cells need to be validated.
 * 
 */
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for row in 0..<board.count {
            for column in 0..<board[row].count {
                if !valid(board, row, column) {
                    return false
                }
            }
        }
        return true
    }
    
    func valid(_ board: [[Character]],_ row: Int = 0,_ column: Int = 0) -> Bool {
        guard row >= 0, 
              row < board.count, 
              column >= 0,
              column < board[row].count
        else { return true }
        
        guard board[row][column] != "." 
        else { return true }
        
        for rowIndex in 0..<board.count {
            if rowIndex == row { continue }
            if board[rowIndex][column] == board[row][column] { print("a"); return false }
        }
        
        for columnIndex in 0..<board[row].count {
            if columnIndex == column { continue }
            if board[row][columnIndex] == board[row][column] {print("b"); return false }
        }
        let i = (row / 3) * 3
        let j = (column / 3) * 3
        for rowItr in 0..<3 {
            for columnItr in 0..<3 {
                if (i + rowItr) == row && (j + columnItr) == column { continue }
                if board[(i + rowItr)][(j + columnItr)] == board[row][column] { return false }
            }
        }
        
        return true
    }
    
    
    
}
