import Cocoa

/// 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

/// 示例 1：
/// 输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
/// 输出：6
/// 解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。
///
///: ## 解题思路
/// 预存值大于0，则与当前值相加，成为新的预存值；如果预存值小于0，则让当前值成为预存值；
/// 比较预存值与最大值，如果预存值大于最大值，则成为新的最大值，反之最大值仍未最大值。

func maxSubArray(_ nums: [Int]) -> Int {
    var preValue = 0
    var maxValue = nums.first!
    for i in 0..<nums.count {
        preValue = max(preValue + nums[i], nums[i])
        maxValue = max(maxValue, preValue)
    }
    return maxValue
}

var inputArray = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
let maxValue = maxSubArray(inputArray)
print(maxValue)


/// 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
/// 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
/// 注意：给定 n 是一个正整数。

/// 示例 1：
/// 输入： 2
/// 输出： 2
/// 解释： 有两种方法可以爬到楼顶。
/// 1.  1 阶 + 1 阶
/// 2.  2 阶
///
/// 解题思路
/// Fn = F(n-1) + F(n-2)
func climbStairs(_ n: Int) -> Int {
    var first = 1
    var second = 2
    var result = 0
    for _ in 3...n {
        result = first + second
        first = second
        second = result
    }
    return result
}

let climbResult = climbStairs(6)
print("clim stairs value = \(climbResult)")

