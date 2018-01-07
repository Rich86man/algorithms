/*
 * [747] Min Cost Climbing Stairs
 *
 * https://leetcode.com/problems/min-cost-climbing-stairs/description/
 *
 * algorithms
 * Easy (45.34%)
 * Total Accepted:    7K
 * Total Submissions: 15.5K
 * Testcase Example:  '[0,0,0,0]'
 *
 * 
 * On a staircase, the i-th step has some non-negative cost cost[i] assigned (0
 * indexed).
 * 
 * Once you pay the cost, you can either climb one or two steps. You need to
 * find minimum cost to reach the top of the floor, and you can either start
 * from the step with index 0, or the step with index 1.
 * 
 * 
 * Example 1:
 * 
 * Input: cost = [10, 15, 20]
 * Output: 15
 * Explanation: Cheapest is start on cost[1], pay that cost and go to the
 * top.
 * 
 * 
 * 
 * Example 2:
 * 
 * Input: cost = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
 * Output: 6
 * Explanation: Cheapest is start on cost[0], and only step on 1s, skipping
 * cost[3].
 * 
 * 
 * 
 * Note:
 * 
 * cost will have a length in the range [2, 1000].
 * Every cost[i] will be an integer in the range [0, 999].
 * 
 * 
 */
class Solution {
    var memo: [Int: Int] = [:]
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        return _minCostClimbingStairs(cost, -1)
    }
    func _minCostClimbingStairs(_ cost: [Int], _ index: Int) -> Int {
        guard index < cost.count - 2 else { return 0 }
        if let m = memo[index] { return m }
        
        let cost1 = cost[index + 1] + _minCostClimbingStairs(cost, index + 1)
        let cost2 = cost[index + 2] + _minCostClimbingStairs(cost, index + 2)
        memo[index] = min(cost1, cost2)
        return memo[index]!
    }
}
