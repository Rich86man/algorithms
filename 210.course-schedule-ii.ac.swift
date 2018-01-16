/*
 * [210] Course Schedule II
 *
 * https://leetcode.com/problems/course-schedule-ii/description/
 *
 * algorithms
 * Medium (29.57%)
 * Total Accepted:    80.5K
 * Total Submissions: 272.1K
 * Testcase Example:  '2\n[[1,0]]'
 *
 * 
 * There are a total of n courses you have to take, labeled from 0 to n - 1.
 * 
 * Some courses may have prerequisites, for example to take course 0 you have
 * to first take course 1, which is expressed as a pair: [0,1]
 * 
 * 
 * Given the total number of courses and a list of prerequisite pairs, return
 * the ordering of courses you should take to finish all courses.
 * 
 * There may be multiple correct orders, you just need to return one of them.
 * If it is impossible to finish all courses, return an empty array.
 * 
 * 
 * For example:
 * 2, [[1,0]]
 * There are a total of 2 courses to take. To take course 1 you should have
 * finished course 0. So the correct course order is [0,1]
 * 
 * 4, [[1,0],[2,0],[3,1],[3,2]]
 * There are a total of 4 courses to take. To take course 3 you should have
 * finished both courses 1 and 2. Both courses 1 and 2 should be taken after
 * you finished course 0. So one correct course order is [0,1,2,3]. Another
 * correct ordering is[0,2,1,3].
 * 
 * Note:
 * 
 * The input prerequisites is a graph represented by a list of edges, not
 * adjacency matrices. Read more about how a graph is represented.
 * You may assume that there are no duplicate edges in the input
 * prerequisites.
 * 
 * 
 * 
 * click to show more hints.
 * 
 * Hints:
 * 
 * This problem is equivalent to finding the topological order in a directed
 * graph. If a cycle exists, no topological ordering exists and therefore it
 * will be impossible to take all courses.
 * Topological Sort via DFS - A great video tutorial (21 minutes) on Coursera
 * explaining the basic concepts of Topological Sort.
 * Topological sort could also be done via BFS.
 * 
 * 
 */
class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var prereqClasses: [Int:Set<Int>] = [:]        
        var degree: [Int: Int] = [:]
        
        for classId in 0..<numCourses {
            degree[classId] = 0    
        }
        
        for classPair in prerequisites {
            let prereq = classPair[0]
            let readyToTakeClass = classPair[1]
            var previousPrereqs = prereqClasses[readyToTakeClass, default: Set<Int>()]
            if !previousPrereqs.contains(prereq) {
                previousPrereqs.insert(prereq)
                degree[prereq, default: 0] += 1
                prereqClasses[readyToTakeClass] = previousPrereqs
            }
        }
    
        var stack = Stack<Int>()
        
        for classId in 0..<numCourses {
            if degree[classId] == 0 {
                stack.push(classId)
            }
        }
        
        var result: [Int] = []
        while stack.count > 0 {
            let classId = stack.pop()!
            result.append(classId)
            
            for preReq in prereqClasses[classId, default: Set<Int>()] {
                degree[preReq, default: 1] -= 1
                if degree[preReq] == 0 {
                    stack.push(preReq)
                }
                
            }
        }
        return result.count == numCourses ? result : []
    }
}

struct Stack<T> {
    private var array: [T] = []
    
    var count: Int {
        return array.count
    }
    
    var top: T? {
        return array.last
    }
    
    mutating func push(_ value: T) {
        array.append(value)
    }
    
    mutating func pop() -> T? {
        return array.popLast()
    }
}

