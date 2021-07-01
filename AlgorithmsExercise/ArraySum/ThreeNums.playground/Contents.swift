import Cocoa

/// https://leetcode-cn.com/problems/3sum/
/// 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。
/// 注意：答案中不可以包含重复的三元组。

/// 示例 1：
/// 输入：nums = [-1,0,1,2,-1,-4]
/// 输出：[[-1,-1,2],[-1,0,1]]

/// 示例 2：
/// 输入：nums = []
/// 输出：[]

/// 示例 3：
/// 输入：nums = [0]
/// 输出：[]


/// 循环 + 双指针
/// 去除重复解
func threeSum(_ nums: [Int]) -> [[Int]] {
    
    // ① 如果数组长度小于 3，直接返回空数组
    if nums.count < 3 {
        return []
    }
    
    // ② 对数组进行排序
    let sortedNums = nums.sorted()
    var result: [[Int]] = []
    
    for i in 0..<sortedNums.count {
        //②-1：因为已经排序，如果 num[i] > 0, 后面数字均大于零，就不可能出现 a + b + C = 0 的情况
        if sortedNums[i] > 0 {
            return result
        }
        // ②-2：跳过重复数字，避免重复解
        if i > 0, sortedNums[i] == sortedNums[i - 1] {
            continue
        }
        // ③ 开始双指针遍历，寻找结果 i ==> a
        var left = i + 1 // 令左指针为 i+1 ==> b
        var right = sortedNums.count - 1 // 令右指针为 nums.count -1 ==> c
        while left < right {
            /// a + b + c = 0
            if sortedNums[i] + sortedNums[left] + sortedNums[right] == 0 {
                result.append([sortedNums[i], sortedNums[left], sortedNums[right]])
                
                while left < right, sortedNums[left] == sortedNums[left + 1] { // 判断当前左指针，是否和下一个值重复，去重解
                    left += 1
                }
                
                while left < right, sortedNums[right] == sortedNums[right - 1] { // 判断当前右指针，是否和前一个值重复，去重解
                    right -= 1
                }
                /// 由于已经找到解，需要两个指针同时移动
                left += 1
                right -= 1
            } else if sortedNums[i] + sortedNums[left] + sortedNums[right] > 0 { // 移动右指针，缩小值
                right -= 1
            } else { // 移动左指针，增大值
                left += 1
            }
        }
    }

    return result
}

/// 暴力遍历法，时间复杂度 O(n3)
/// Note: 去重同时，注意都为0的去重
func threeNumsSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 {
        return []
    }
    var result: [[Int]] = []
    var zeroTimes: Int = 0
    for i in 0..<nums.count - 2 {
        for j in (i + 1)..<nums.count - 1 {
            for k in (j + 1)..<nums.count {
                let a = nums[i], b = nums[j], c = nums[k]
                if a + b + c == 0 {
                    var flag = false
                    result.forEach { item in
                        if item.contains(a), item.contains(b), item.contains(c) {
                            flag = true
                            if a == 0, b == 0, c == 0, zeroTimes <= 0 {
                                flag = false
                            }
                        }
                    }
                    if !flag {
                        if a == 0, b == 0, c == 0{
                            zeroTimes += 1
                        }
                        result.append([a, b, c])
                    }
                }
            }
        }
    }
    return result
}


let nums = [-2,0,3,-1,4,0,3,4,1,1,1,-3,-5,4,0] //[-1,0,1,2,-1,-4] // [0,0,0,0] //[-4,-2,1,-5,-4,-4,4,-2,0,4,0,-2,3,1,-5,0]//[-2,0,3,-1,4,0,3,4,1,1,1,-3,-5,4,0]
let result = threeNumsSum(nums)
print(result)
