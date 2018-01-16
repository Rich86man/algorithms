/*
 * [122] Best Time to Buy and Sell Stock II
 *
 * https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/
 *
 * algorithms
 * Easy (47.82%)
 * Total Accepted:    177.5K
 * Total Submissions: 371.3K
 * Testcase Example:  '[]'
 *
 * Say you have an array for which the ith element is the price of a given
 * stock on day i.
 * 
 * Design an algorithm to find the maximum profit. You may complete as many
 * transactions as you like (ie, buy one and sell one share of the stock
 * multiple times). However, you may not engage in multiple transactions at the
 * same time (ie, you must sell the stock before you buy again).
 */
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else {return 0}
        var totalProfit = 0
        var buyPrice = prices[0]
        for index in 1..<prices.count {
            if prices[index] > buyPrice {
                totalProfit += prices[index] - buyPrice
            }
            buyPrice = prices[index]
        }
        return totalProfit
    }
}
