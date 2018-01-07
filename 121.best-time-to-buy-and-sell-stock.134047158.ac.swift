/*
 * [121] Best Time to Buy and Sell Stock
 *
 * https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/
 *
 * algorithms
 * Easy (42.34%)
 * Total Accepted:    253.3K
 * Total Submissions: 598.2K
 * Testcase Example:  '[7,1,5,3,6,4]'
 *
 * Say you have an array for which the ith element is the price of a given
 * stock on day i.
 * 
 * If you were only permitted to complete at most one transaction (ie, buy one
 * and sell one share of the stock), design an algorithm to find the maximum
 * profit.
 * 
 * Example 1:
 * 
 * Input: [7, 1, 5, 3, 6, 4]
 * Output: 5
 * 
 * max. difference = 6-1 = 5 (not 7-1 = 6, as selling price needs to be larger
 * than buying price)
 * 
 * 
 * 
 * Example 2:
 * 
 * Input: [7, 6, 4, 3, 1]
 * Output: 0
 * 
 * In this case, no transaction is done, i.e. max profit = 0.
 * 
 * 
 */
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
     
        var maxProfit = 0
        var buyPrice = prices[0]
        for index in 1..<prices.count {
             if (prices[index] - buyPrice) < 0 {
                 buyPrice = prices[index]
             } else {
                 let currentProfit = prices[index] - buyPrice
                 maxProfit = max(maxProfit, currentProfit)
             }
            
        }
        
        
        return maxProfit
    }
}
