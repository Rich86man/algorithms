/*
 * [79] Word Search
 *
 * https://leetcode.com/problems/word-search/description/
 *
 * algorithms
 * Medium (27.70%)
 * Total Accepted:    158.3K
 * Total Submissions: 571.7K
 * Testcase Example:  '[["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]\n"ABCCED"'
 *
 * 
 * Given a 2D board and a word, find if the word exists in the grid.
 * 
 * 
 * The word can be constructed from letters of sequentially adjacent cell,
 * where "adjacent" cells are those horizontally or vertically neighboring. The
 * same letter cell may not be used more than once.
 * 
 * 
 * 
 * For example,
 * Given board = 
 * 
 * [
 * ⁠ ['A','B','C','E'],
 * ⁠ ['S','F','C','S'],
 * ⁠ ['A','D','E','E']
 * ]
 * 
 * 
 * word = "ABCCED", -> returns true,
 * word = "SEE", -> returns true,
 * word = "ABCB", -> returns false.
 * 
 */
class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        for row in 0..<board.count {
            for column in 0..<board[row].count {
                let seen = [[Int]](repeating: [Int](repeating: 0, count: board[row].count + 2), count: board.count + 2)
                if search(board, word, 0,row, column, seen) {
                    return true
                }
            }
        }   
        return false
    }
    
    func search(_ board: [[Character]], _ word: String,_ index: Int,_ row: Int,_ column: Int, _ seen: [[Int]]) -> Bool {
        
        guard index < word.count
        else { return true }
        
        guard row >= 0, 
              row < board.count, 
              column >= 0, 
              column < board[row].count  
        else { return false }
        
        guard seen[row][column] == 0 
        else { return false }
        
        var s = seen 
        s[row][column] = 1
        return word[word.index(word.startIndex, offsetBy: index)] == board[row][column] &&
               (search(board, word, index + 1, row + 1, column, s) ||
               search(board, word, index + 1, row - 1, column, s) ||
               search(board, word, index + 1, row, column + 1, s) ||
               search(board, word, index + 1, row, column - 1, s)) 
        
    }
}
