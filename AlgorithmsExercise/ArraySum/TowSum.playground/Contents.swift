import Cocoa

/// 两数之和
/// https://leetcode-cn.com/problems/two-sum/
/// 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。
/// 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。你可以按任意顺序返回答案。

/// 示例 1：
/// 输入：nums = [2,7,11,15], target = 9
/// 输出：[0,1]
/// 解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。

/// 示例 2：
/// 输入：nums = [3,2,4], target = 6
/// 输出：[1,2]

/// 示例 3：
/// 输入：nums = [3,3], target = 6
/// 输出：[0,1]

/// 暴力枚举法
func twoSum(with nums: [Int], target: Int) -> [Int] {
    for i in 0..<nums.count - 1 {
        for j in (i + 1)..<nums.count {
            if nums[i] + nums [j] == target {
                return [i, j]
            }
        }
    }
    return []
}

/// Hashtable 解法
func hashTableTwoSum(with nums: [Int], target: Int) -> [Int] {
    var hashtable: [Int: Int] = [: ]
    for i in 0..<nums.count {
        if hashtable.keys.contains(target - nums[i]) {
            return [hashtable[target - nums[i]] ?? -1, i]
        }
        hashtable[nums[i]] = i
    }
    return []
}

/**
 
 解法总结：
 1. 暴力枚举解法，双层 for 循环。注意点：注意双层 for 循环的指针范围取值。 时间复杂度 O(n2), 空间复杂度 O(n)
 2. Hashtable 解法，for 循环比较目标值 - nums[i] 是否在 hashtable中，不在将 nums[i] 存入 hashtable，以备比较使用。
    注意点：hashtable 中 key 为 nums[i], value 为 i。 时间复杂度 O(n), 空间复杂度 O(n)
 */
