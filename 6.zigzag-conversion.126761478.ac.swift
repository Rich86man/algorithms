/*
 * [6] ZigZag Conversion
 *
 * https://leetcode.com/problems/zigzag-conversion/description/
 *
 * algorithms
 * Medium (27.09%)
 * Total Accepted:    187.4K
 * Total Submissions: 691.6K
 * Testcase Example:  '""\n1'
 *
 * 
 * The string "PAYPALISHIRING" is written in a zigzag pattern on a given number
 * of rows like this: (you may want to display this pattern in a fixed font for
 * better legibility)
 * 
 * P   A   H   N
 * A P L S I I G
 * Y   I   R
 * 
 * 
 * And then read line by line: "PAHNAPLSIIGYIR"
 * 
 * 
 * Write the code that will take a string and make this conversion given a
 * number of rows:
 * 
 * string convert(string text, int nRows);
 * 
 * convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".
 * 
 */

enum Direction {
    case up, down
}
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        var array: [String] = []
        var newString = ""
        var direction: Direction = .down
        var row = 0
        for _ in 0..<numRows {
            array.append("")
        }

        for char in s {
            array[row].append(char)

            if row == 0 {
                direction = .down
            } else if row == numRows - 1 {
                direction = .up
            }

            switch direction {
            case .up:
                row -= 1
            case .down:
                row += 1
            }
        }


        print(array)
        return array.joined(separator: "")
    }
}
