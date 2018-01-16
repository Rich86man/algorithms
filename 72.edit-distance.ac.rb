#
# [72] Edit Distance
#
# https://leetcode.com/problems/edit-distance/description/
#
# algorithms
# Hard (32.29%)
# Total Accepted:    105.6K
# Total Submissions: 327K
# Testcase Example:  '""\n""'
#
# 
# Given two words word1 and word2, find the minimum number of steps required to
# convert word1 to word2. (each operation is counted as 1 step.)
# 
# 
# 
# You have the following 3 operations permitted on a word:
# 
# 
# 
# a) Insert a character
# b) Delete a character
# c) Replace a character
# 
#
# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
    l = [word1.length, word2.length].max
    dp = Array.new(l + 1){Array.new(l + 1,0)}
    
    n = 1 
    m = 1
    
    while n <= l do
        dp[n][0] = n
        while m <= l do 
            dp[0][m] = m
            
            dp[n][m] = [dp[n - 1][m] + 1, 
                            dp[n][m - 1] + 1, 
                            dp[n - 1][m - 1] + (word1[n - 1] == word2[m - 1] ? 0 : 1)].min
            m += 1
        end
        n += 1
        m = 1
    end
    # dp.each {|r| puts r.inspect}
    dp[word1.length][word2.length] rescue 0
end
