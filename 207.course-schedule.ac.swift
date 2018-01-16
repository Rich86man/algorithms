/*
 * [207] Course Schedule
 *
 * https://leetcode.com/problems/course-schedule/description/
 *
 * algorithms
 * Medium (33.08%)
 * Total Accepted:    107.4K
 * Total Submissions: 324.6K
 * Testcase Example:  '2\n[[1,0]]'
 *
 * 
 * There are a total of n courses you have to take, labeled from 0 to n - 1.
 * 
 * Some courses may have prerequisites, for example to take course 0 you have
 * to first take course 1, which is expressed as a pair: [0,1]
 * 
 * 
 * Given the total number of courses and a list of prerequisite pairs, is it
 * possible for you to finish all courses?
 * 
 * 
 * For example:
 * 2, [[1,0]]
 * There are a total of 2 courses to take. To take course 1 you should have
 * finished course 0. So it is possible.
 * 
 * 2, [[1,0],[0,1]]
 * There are a total of 2 courses to take. To take course 1 you should have
 * finished course 0, and to take course 0 you should also have finished course
 * 1. So it is impossible.
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
 * This problem is equivalent to finding if a cycle exists in a directed graph.
 * If a cycle exists, no topological ordering exists and therefore it will be
 * impossible to take all courses.
 * Topological Sort via DFS - A great video tutorial (21 minutes) on Coursera
 * explaining the basic concepts of Topological Sort.
 * Topological sort could also be done via BFS.
 * 
 * 
 */
/*
 * [207] Course Schedule
 *
 * https://leetcode.com/problems/course-schedule/description/
 *
 * algorithms
 * Medium (33.08%)
 * Total Accepted:    107.4K
 * Total Submissions: 324.6K
 * Testcase Example:  '2\n[[1,0]]'
 *
 * 
 * There are a total of n courses you have to take, labeled from 0 to n - 1.
 * 
 * Some courses may have prerequisites, for example to take course 0 you have
 * to first take course 1, which is expressed as a pair: [0,1]
 * 
 * 
 * Given the total number of courses and a list of prerequisite pairs, is it
 * possible for you to finish all courses?
 * 
 * 
 * For example:
 * 2, [[1,0]]
 * There are a total of 2 courses to take. To take course 1 you should have
 * finished course 0. So it is possible.
 * 
 * 2, [[1,0],[0,1]]
 * There are a total of 2 courses to take. To take course 1 you should have
 * finished course 0, and to take course 0 you should also have finished course
 * 1. So it is impossible.
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
 * This problem is equivalent to finding if a cycle exists in a directed graph.
 * If a cycle exists, no topological ordering exists and therefore it will be
 * impossible to take all courses.
 * Topological Sort via DFS - A great video tutorial (21 minutes) on Coursera
 * explaining the basic concepts of Topological Sort.
 * Topological sort could also be done via BFS.
 *
 *
 */
class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph = [Set<Int>](repeating: Set<Int>(), count: numCourses + 1) // i -> j
        var prereqCount = [Int:Int]() // prereqCount[x] = number edges into prereqCount
        for index in 0...numCourses {
            prereqCount[index] = 0
        }
        for preReq in prerequisites {
            graph[preReq[0]].insert(preReq[1])
            prereqCount[preReq[1], default: 0] += 1
        }

        var stack = [Int]()

        for index in 0...numCourses {
            if prereqCount[index] == 0 {
                stack.append(index)
            }
        }

        var classesTaken = 0

        while !stack.isEmpty {
            let top = stack[0]
            stack.remove(at: 0)
            classesTaken += 1
            for dependency in graph[top] {
                prereqCount[dependency, default: 1] -= 1
                if prereqCount[dependency] == 0 {
                    stack.append(dependency)
                }
            }
        }
        return classesTaken >= numCourses
    }
}




































class sSolution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var precedence: [Int: Set<Int>] = [:]
        var degree: [Int: Int] = [:]
        for classId in 0..<numCourses {
            degree[classId] = 0
        }

        for pair in prerequisites {

            let top = pair[0]
            let bottom = pair[1]

            var dependecies = precedence[top, default: Set<Int>()]
            if !dependecies.contains(bottom) {
                dependecies.insert(bottom)
                degree[bottom, default: 0] += 1
                precedence[top] = dependecies
            }
        }

        var possibleCourses = 0

        var stack = Stack<Int>()

        for classId in degree.keys {
            if degree[classId] == 0 {
                stack.push(classId)
            }
        }
        if stack.count == 0 { return false }
        while stack.count > 0 {
            let classId = stack.pop()!
            possibleCourses += 1

            for nextClass in precedence[classId, default: Set<Int>()] {

                degree[nextClass]! -= 1
                if degree[nextClass] == 0 {
                    stack.push(nextClass)
                }

            }
        }

        return possibleCourses == numCourses
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



// print(NSolution().canFinish(4, [[1,0],[0,1], [1,2], [2,3],[4,4]]))
// print(Solution().canFinish(4, [[1,0],[0,1], [1,2], [2,3],[4,4]]))

// print(NSolution().canFinish(2, [[1,0]]))
// print(Solution().canFinish(2, [[1,0]]))
