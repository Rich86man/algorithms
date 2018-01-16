#
# [161] One Edit Distance
#
# https://leetcode.com/problems/one-edit-distance/description/
#
# algorithms
# Medium (31.70%)
# Total Accepted:    44.7K
# Total Submissions: 140.9K
# Testcase Example:  '""\n""'
#
# Given two strings S and T, determine if they are both one edit distance apart.
#
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_one_edit_distance(s, t)
    return t.length == 1 if !s && t 
    return s.length == 1 if !t && s
    return s.length == 1 if t.length == 0
    return t.length == 1 if s.length == 0
    return t[0] != s[0] if t.length == 1 && s.length == 1
    
    return false if (s.length - t.length).abs > 1
    
    l = 0
    r = 0
    while l < s.length && r < t.length && s[l] == t[r] do
        l += 1
        r += 1
    end
    
    return false if l == s.length && r == t.length
    if s.length == t.length
        r += 1
        l += 1
    elsif s.length < t.length 
        r += 1
    else
        l += 1
    end
    
    while l < s.length && r < t.length && s[l] == t[r] do
        l += 1
        r += 1
    end
    
    return s[l] == t[r]
    
    return is_one_edit_distance(s[l..-1], t[r+1..-1]) == false && is_one_edit_distance(s[l+1..-1],t[r..-1]) == false
    
end
