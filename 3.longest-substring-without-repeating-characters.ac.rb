#
# [3] Longest Substring Without Repeating Characters
#
# https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
#
# algorithms
# Medium (24.55%)
# Total Accepted:    411.2K
# Total Submissions: 1.7M
# Testcase Example:  '"abcabcbb"'
#
# Given a string, find the length of the longest substring without repeating
# characters.
# 
# Examples:
# 
# Given "abcabcbb", the answer is "abc", which the length is 3.
# 
# Given "bbbbb", the answer is "b", with the length of 1.
# 
# Given "pwwkew", the answer is "wke", with the length of 3. Note that the
# answer must be a substring, "pwke" is a subsequence and not a substring.
#
# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    return s.length if s.length < 2
    
    window_start = 0
    window_end = 0
    cache = Hash.new
    answer = 0
    
    while window_end < s.length do
        if cache.key? s[window_end] 
            window_start = [window_start, cache[s[window_end]] + 1].max
        end
        answer = [answer, window_end - window_start + 1].max
        cache[s[window_end]] = window_end
        window_end += 1

    end
    
    return answer
end
