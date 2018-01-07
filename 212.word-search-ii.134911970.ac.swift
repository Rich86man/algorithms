/*
 * [212] Word Search II
 *
 * https://leetcode.com/problems/word-search-ii/description/
 *
 * algorithms
 * Hard (24.27%)
 * Total Accepted:    57.6K
 * Total Submissions: 237.1K
 * Testcase Example:  '[["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]]\n["oath","pea","eat","rain"]'
 *
 * 
 * Given a 2D board and a list of words from the dictionary, find all words in
 * the board.
 * 
 * 
 * Each word must be constructed from letters of sequentially adjacent cell,
 * where "adjacent" cells are those horizontally or vertically neighboring. The
 * same letter cell may not be used more than once in a word.
 * 
 * 
 * 
 * For example,
 * Given words = ["oath","pea","eat","rain"] and board = 
 * 
 * [
 * ⁠ ['o','a','a','n'],
 * ⁠ ['e','t','a','e'],
 * ⁠ ['i','h','k','r'],
 * ⁠ ['i','f','l','v']
 * ]
 * 
 * 
 * Return ["eat","oath"].
 * 
 * 
 * 
 * Note:
 * You may assume that all inputs are consist of lowercase letters a-z.
 * 
 * 
 * click to show hint.
 * 
 * You would need to optimize your backtracking to pass the larger test. Could
 * you stop backtracking earlier?
 * 
 * If the current candidate does not exist in all words' prefix, you could stop
 * backtracking immediately. What kind of data structure could answer such
 * query efficiently? Does a hash table work? Why or why not? How about a Trie?
 * If you would like to learn how to implement a basic trie, please work on
 * this problem: Implement Trie (Prefix Tree) first.
 * 
 */
class TrieNode {
    let char: Character
    var children: Set<TrieNode> = Set<TrieNode>()
    var word: String? = nil

    init(_ char: Character) {
        self.char = char
    }

}

extension TrieNode: Hashable, Equatable {
    var hashValue: Int {
        return char.hashValue
    }
}
func ==(lhs: TrieNode, rhs: TrieNode) -> Bool {
    return lhs.char == rhs.char
}

extension TrieNode {


    func insert(_ word: String) {

        var current = self
        for character in word {

            if let node = current.children.filter({ $0.char == character }).first {
                current = node
            } else {
                let newNode = TrieNode(character)
                current.children.insert(newNode)
                current = newNode
            }
        }
        current.word = word
    }
    
    func remove(_ word: String) {
        var current = self
        for character in word {
            if let node = current.children.filter({ $0.char == character }).first {
                current = node
            }
        }
        current.word = nil
    }

    func contains(_ word: String) -> Bool {
        var current = self
        for character in word {
            if let node = current.children.filter({ $0.char == character }).first {
                current = node
            } else {
                return false
            }
        }
        return current.word != nil
    }

    func containsSubstring(_ substring: String) -> Bool {
        var current = self
        for character in substring {
            if let node = current.children.filter({ $0.char == character }).first {
                current = node
            } else {
                return false
            }
        }
        return true
    }

}


class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        var root = TrieNode("*")
        words.forEach({ root.insert($0) })
        var result: Set<String> = Set<String>()
        for row in 0..<board.count {
            for column in 0..<board[row].count {
                var visited: [String: Bool] = [:]
                var found = search( board, root, row, column, visited)
                while found != nil {
                    result.insert(found!)
                    root.remove(found!)
                    visited = [:]
                    found = search( board, root, row, column, visited)
                }
            }
        }
        return Array(result)
    }

    enum Direction {
        case left, right, top, bottom
    }
    func search(_ board: [[Character]], _ root: TrieNode,_ row: Int, _ column: Int,_ visited: [String: Bool]) -> String? {
        guard visited["\(row)-\(column)", default: false] == false else { return nil }

        if let word = root.word { return word }
        guard row >= 0, row < board.count, column >= 0, column < board[row].count else { return nil }
        guard let next = root.children.filter({ $0.char == board[row][column]} ).first else {
            // print(root.char, root.children.map{ $0.char }, row, column)
            return nil
        }

        var v = visited 
        v["\(row)-\(column)"] = true
        return [search(board, next, row - 1, column, v),
                search(board, next, row + 1, column, v),
                search(board, next, row, column - 1, v),
                search(board, next, row, column + 1, v)
                ].flatMap({$0}).first
    }
}
