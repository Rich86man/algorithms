/*
 * [322] Coin Change
 *
 * https://leetcode.com/problems/coin-change/description/
 *
 * algorithms
 * Medium (26.74%)
 * Total Accepted:    80.5K
 * Total Submissions: 300.9K
 * Testcase Example:  '[1]\n0'
 *
 * 
 * You are given coins of different denominations and a total amount of money
 * amount. Write a function to compute the fewest number of coins that you need
 * to make up that amount. If that amount of money cannot be made up by any
 * combination of the coins, return -1.
 * 
 * 
 * 
 * Example 1:
 * coins = [1, 2, 5], amount = 11
 * return 3 (11 = 5 + 5 + 1)
 * 
 * 
 * 
 * Example 2:
 * coins = [2], amount = 3
 * return -1.
 * 
 * 
 * 
 * Note:
 * You may assume that you have an infinite number of each kind of coin.
 * 
 * 
 * Credits:Special thanks to @jianchao.li.fighter for adding this problem and
 * creating all test cases.
 */
class Solution {
    var combinations: [[Int]] = []
    var minimum = Int.max
    var memo = [String: Int]()
    
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        
        var dp = [Int].init(repeating: Int.max, count: amount + 2) 
        dp[0] = 0

        for smallerAmount in 1...amount {

            for coin in coins {
                if smallerAmount - coin >= 0 && dp[smallerAmount - coin] != Int.max {
                    dp[smallerAmount] = min(dp[smallerAmount], dp[smallerAmount - coin] + 1)
                }
            }
        }

        return dp[amount] == Int.max ? -1 : dp[amount]
        
        _coinChange(0, coins, amount, 0)
        return minimum == Int.max ? -1 : minimum
    }
    
    func _coinChange(_ numCoins: Int, _ coins: [Int], _ amount: Int,_ index: Int) { 
        if memo["\(numCoins)-\(amount)"] != nil { return }
        if amount == 0 { minimum = min(minimum, numCoins); return }
        guard amount > 0 else { return }
        guard index < coins.count else { return }
        
        
        for coin in coins {
            _coinChange(numCoins + 1, coins, amount - coin, index)
        }
        memo["\(numCoins)-\(amount)"] = 1
    }
}
