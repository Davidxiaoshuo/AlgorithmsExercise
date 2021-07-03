import Cocoa

/// 两数之和 ~ 输入有序数组
/// https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted/
/// 给定一个已按照 升序排列  的整数数组 numbers ，请你从数组中找出两个数满足相加之和等于目标数 target 。
/// 函数应该以长度为 2 的整数数组的形式返回这两个数的下标值。numbers 的下标 从 1 开始计数 ，所以答案数组应当满足 1 <= answer[0] < answer[1] <= numbers.length 。
/// 你可以假设每个输入只对应唯一的答案，而且你不可以重复使用相同的元素

/// 示例 1：
/// 输入：numbers = [2,7,11,15], target = 9
/// 输出：[1,2]
/// 解释：2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 。

/// 暴力枚举法
func twoSum(with numbers: [Int], target: Int) -> [Int] {
    for i in 0..<numbers.count - 1 {
        for j in (i + 1)..<numbers.count {
            if numbers[i] + numbers[j] == target,
               numbers[i] <= numbers[j] {
                return [i + 1, j + 1]
            }
        }
    }
    return []
}

/// 双指针
func doublePointsTwoSum(with numbers: [Int], target: Int) -> [Int] {
    var leftIndex: Int = 0
    var rightIndex: Int = numbers.count - 1
    while leftIndex <= rightIndex {
        if numbers[leftIndex] + numbers[rightIndex] > target {
            rightIndex -= 1
        } else if numbers[leftIndex] + numbers[rightIndex] < target {
            leftIndex += 1
        } else {
            return [leftIndex + 1, rightIndex + 1]
        }
    }
    return []
}

/// 二分查找
func twoSplideSearchTwoSum(with numbers: [Int], target: Int) -> [Int] {
    for i in 0..<numbers.count {
        var lowIndex = i + 1, hightIndex = numbers.count - 1
        while lowIndex <= hightIndex {
            let midIndex = (hightIndex - lowIndex) / 2 + lowIndex
            if numbers[midIndex] + numbers[i] >  target {
                hightIndex = midIndex - 1
            } else if numbers[midIndex] + numbers[i] < target {
                lowIndex = midIndex + 1
            } else {
                return [i + 1, midIndex + 1]
            }
        }
    }
    return []
}


let numbsers = [5,25,75]
let target = 100

let result = twoSum(with: numbsers, target: target)
print("[\(result.first ?? -1), \(result.last ?? -1)]")


/**
解法总结：注意题意中 index 值需 +1 所得
 1. 暴力枚举法，双层 for 循环。注意点：注意双层 for 循环的指针范围取值。
    时间复杂度 O(n2), 空间复杂度 O(n)
 2. 双指针解法，首先数组确定为有序数组，left，right 指针分别向内侧移动。
    时间复杂度 O(n), 空间复杂度 O(1)
    left + right > target, right -= 1, 向内侧移动
    left + right < target, left += 1, 向内侧移动
    left + right == target，取到目标值，返回 left, right 的 index + 1
 3. 二分查找解法，通过指针折半缩小查找范围。 注意点：midIndex = (high - low) + low, lowIndex 为 i + 1;
    mid + i > target, high = mid - 1
    mid + i < target, low = mid + 1
    时间复杂度 O(nlog-n), 空间复杂度 O(1)
 */
