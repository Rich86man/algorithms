#
# [155] Min Stack
#
# https://leetcode.com/problems/min-stack/description/
#
# algorithms
# Easy (30.18%)
# Total Accepted:    164.2K
# Total Submissions: 544K
# Testcase Example:  '["MinStack","push","push","push","getMin","pop","top","getMin"]\n[[],[-2],[0],[-3],[],[],[],[]]'
#
# 
# Design a stack that supports push, pop, top, and retrieving the minimum
# element in constant time.
# 
# 
# push(x) -- Push element x onto stack.
# 
# 
# pop() -- Removes the element on top of the stack.
# 
# 
# top() -- Get the top element.
# 
# 
# getMin() -- Retrieve the minimum element in the stack.
# 
# 
# 
# 
# Example:
# 
# MinStack minStack = new MinStack();
# minStack.push(-2);
# minStack.push(0);
# minStack.push(-3);
# minStack.getMin();   --> Returns -3.
# minStack.pop();
# minStack.top();      --> Returns 0.
# minStack.getMin();   --> Returns -2.
# 
# 
#
class MinStack
    attr_accessor :stack
    attr_accessor :minValue
=begin
    initialize your data structure here.
=end
    def initialize()
        @stack = []
    end


=begin
    :type x: Integer
    :rtype: Void
=end
    def push(x)
        if @stack.empty?
            @minValue = x
        end
        
        if x <= @minValue 
            @stack.push @minValue
            @minValue = x
        end
        @stack.push(x)  
    end


=begin
    :rtype: Void
=end
    def pop()
        if @stack.pop() == @minValue
            @minValue = @stack.pop()
        end
    end


=begin
    :rtype: Integer
=end
    def top()
        @stack.last
    end


=begin
    :rtype: Integer
=end
    def get_min()
        @minValue
    end


end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(x)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()
