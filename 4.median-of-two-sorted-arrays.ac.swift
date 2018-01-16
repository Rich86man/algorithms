/*
 * [4] Median of Two Sorted Arrays
 *
 * https://leetcode.com/problems/median-of-two-sorted-arrays/description/
 *
 * algorithms
 * Hard (22.54%)
 * Total Accepted:    221.5K
 * Total Submissions: 982.8K
 * Testcase Example:  '[1,3]\n[2]'
 *
 * There are two sorted arrays nums1 and nums2 of size m and n respectively.
 * 
 * Find the median of the two sorted arrays. The overall run time complexity
 * should be O(log (m+n)).
 * 
 * Example 1:
 * 
 * nums1 = [1, 3]
 * nums2 = [2]
 * 
 * The median is 2.0
 * 
 * 
 * 
 * Example 2:
 * 
 * nums1 = [1, 2]
 * nums2 = [3, 4]
 * 
 * The median is (2 + 3)/2 = 2.5
 * 
 * 
 */
class Solution {
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let x = nums1.count
        let y = nums2.count
        guard x <= y else { return findMedianSortedArrays(nums2, nums1) }
        
        var start = 0
        var end = x
        print("a")
        while (start <= end) {
            print(start, end)
            let xPartition = (start + end) / 2
            let yPartition = (x + y + 1) / 2 - xPartition
            // print(start, end, xPartition, yPartition)
            let xLeftValue = xPartition == 0 ? Int.min : nums1[xPartition - 1]
            let xRightValue = xPartition == x ? Int.max : nums1[xPartition]
            
            let yLeftValue = yPartition == 0 ? Int.min : nums2[yPartition - 1]
            let yRightValue = yPartition == y ? Int.max : nums2[yPartition]
            
            if (xLeftValue <= yRightValue && yLeftValue <= xRightValue) {
                if (x + y) % 2 == 0 {
                    // print(xLeftValue, yLeftValue, xRightValue, yRightValue)
                    return Double(max(xLeftValue, yLeftValue) + min(xRightValue, yRightValue)) / 2.0
                } else {
                    return Double(max(xLeftValue, yLeftValue))
                }
            } else if (xLeftValue > yRightValue) {
                end = xPartition - 1
            } else {
                start = xPartition + 1
            }         
        }
        
        
        return 0.0
    }
    
    
    func median(_ array: [Int]) -> Double {
        guard array.count > 0 else { return 0 }
        guard array.count > 1 else { return Double(array[0]) }
        if array.count % 2 == 0 {
            return (Double(array[(array.count / 2) - 1]) + Double(array[array.count / 2])) / 2.0                
        } else {
            return Double(array[array.count / 2])
        }
        
        
    }
    
    
    func zipup(_ a: [Int], _ b: [Int]) -> [Int] {
        
        var result: [Int] = []
    
        var aptr = 0
        var bptr = 0
        
        while aptr < a.count || bptr < b.count {
            if aptr >= a.count {
                result.append(b[bptr])
                bptr += 1
                continue
            } 
            if bptr >= b.count {
                result.append(a[aptr])
                aptr += 1
                continue
            }
            if a[aptr] < b[bptr] {
                result.append(a[aptr])
                aptr += 1
            } else {
                result.append(b[bptr])
                bptr += 1
            }
        }
        
        return result
    }
    
}
