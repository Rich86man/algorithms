/*
 * [292] Nim Game
 *
 * https://leetcode.com/problems/nim-game/description/
 *
 * algorithms
 * Easy (55.30%)
 * Total Accepted:    151.6K
 * Total Submissions: 274.2K
 * Testcase Example:  '1'
 *
 * 
 * You are playing the following Nim Game with your friend: There is a heap of
 * stones on the table, each time one of you take turns to remove 1 to 3
 * stones. The one who removes the last stone will be the winner. You will take
 * the first turn to remove the stones.
 * 
 * 
 * 
 * Both of you are very clever and have optimal strategies for the game. Write
 * a function to determine whether you can win the game given the number of
 * stones in the heap.
 * 
 * 
 * 
 * For example, if there are 4 stones in the heap, then you will never win the
 * game: no matter 1, 2, or 3 stones you remove, the last stone will always be
 * removed by your friend.
 * 
 * 
 * Credits:Special thanks to @jianchao.li.fighter for adding this problem and
 * creating all test cases.
 */
class Solution {
    func canWinNim(_ n: Int) -> Bool {
        return n % 4 != 0
        return _canWinNim(n, true)
    }
    
    // func _canWinNim(_ n: Int, _ myTurn: bool, inout cache: [Int: Bool]) -> Bool {
    func _canWinNim(_ n: Int, _ myTurn: Bool) -> Bool {
        if n <= 3 { return myTurn }
        
        
        
        return _canWinNim(n - 1, !myTurn) || _canWinNim(n - 2, !myTurn) || _canWinNim(n - 3, !myTurn)
    }
    
}
