import Cocoa

/**
 https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 
 示例 1:
 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 
 示例 2:
 输入: s = "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 
 示例 3:
 输入: s = "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 
 示例 4:
 输入: s = ""
 输出: 0
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    var hashtable: [Character: Int] = [: ]
    var start: Int = 0
    var result: Int = 0
   
    let characters = Array(s)
    for i in 0..<characters.count {
        let tempCharacter = characters[i]
        if hashtable.keys.contains(tempCharacter) {
            start = max(hashtable[tempCharacter] ?? -1, start)
        }
        result = max(result, i - start + 1)
        hashtable[tempCharacter] = i + 1
    }
    return result
}

let inputStr = "c"
let result = lengthOfLongestSubstring(inputStr)
print(result)


/**
 题解总结:
 1. 首先需要关系 swift 中，针对字符串的处理。 swift 版本变化，导致对 String 内很多函数的变化比较大
 2. 采用滑动窗口的方式 https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/solution/hua-jie-suan-fa-3-wu-zhong-fu-zi-fu-de-zui-chang-z/
 定义一个 map 数据结构存储 (k, v)，其中 key 值为字符，value 值为字符位置 +1，加 1 表示从字符位置后一个才开始不重复
 我们定义不重复子串的开始位置为 start，结束位置为 end
 随着 end 不断遍历向后，会遇到与 [start, end] 区间内字符相同的情况，此时将字符作为 key 值，获取其 value 值，并更新 start，此时 [start, end] 区间内不存在重复字符
 无论是否更新 start，都会更新其 map 数据结构和结果 ans。
 时间复杂度：O(n)
 */
