import Cocoa

/// 两数之和

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

class TwoSumCommon {
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
}

/// 两数之和 ~ 输入有序数组

/// 给定一个已按照 升序排列  的整数数组 numbers ，请你从数组中找出两个数满足相加之和等于目标数 target 。
/// 函数应该以长度为 2 的整数数组的形式返回这两个数的下标值。numbers 的下标 从 1 开始计数 ，所以答案数组应当满足 1 <= answer[0] < answer[1] <= numbers.length 。
/// 你可以假设每个输入只对应唯一的答案，而且你不可以重复使用相同的元素

/// 示例 1：
/// 输入：numbers = [2,7,11,15], target = 9
/// 输出：[1,2]
/// 解释：2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 。

class TwoSumSort {
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
//    func twoSplideSearchTwoSum(with numbers: [Int], target: Int) -> [Int] {
//        for i in 0..<numbers.count {
//
//        }
//    }
    
}

/// 两数之和 - 数据结构
/// 设计一个接收整数流的数据结构，该数据结构支持检查是否存在两数之和等于特定值。
/// 实现 TwoSum 类：
/// TwoSum() 使用空数组初始化 TwoSum 对象
/// void add(int number) 向数据结构添加一个数 number
/// boolean find(int value) 寻找数据结构中是否存在一对整数，使得两数之和与给定的值相等。如果存在，返回 true ；否则，返回 false 。

/// 示例：
/// 输入：
/// ["TwoSum", "add", "add", "add", "find", "find"]
/// [[], [1], [3], [5], [4], [7]]
/// 输出：
/// [null, null, null, null, true, false]
/// 解释：
/// TwoSum twoSum = new TwoSum();
/// twoSum.add(1);   // [] --> [1]
/// twoSum.add(3);   // [1] --> [1,3]
/// twoSum.add(5);   // [1,3] --> [1,3,5]
/// twoSum.find(4);  // 1 + 3 = 4，返回 true
/// twoSum.find(7);  // 没有两个整数加起来等于 7 ，返回 false

class TwoSumDataStructure {
    
    /// number: count
    var hashtable: [Int: Int] = [: ]
    
    var dataSource: [Int] = []
    var isSort: Bool = false
    
    init() {
    }
    
    // MAKR: -  Hashtable 解法
    func hashAdd(_ number: Int) {
        if hashtable.keys.contains(number) {
            hashtable[number]! += 1
            return
        }
        hashtable[number] = 1
    }
    
    func hashFind(_ value: Int) -> Bool {
        for (_, mapValue) in hashtable.enumerated() {
            let diffValue = value - mapValue.key
            if diffValue != mapValue.key {
                if hashtable.keys.contains(diffValue) {
                    return true
                }
            } else {
                if mapValue.value > 1 {
                    return true
                }
            }
        }
        return false
    }
    
    // MAKR: 双指针解法
    func add(_ number: Int) {
        dataSource.append(number)
        isSort = false
    }
    
    func find(_ value: Int) -> Bool {
        /// 双指针解数组的关键在于有序排列
        if !isSort {
            dataSource.sort()
        }
        
        var left = 0
        var right = dataSource.count - 1
        
        while left <= right {
            if dataSource[left] + dataSource[right] == value {
                return true
            } else if dataSource[left] + dataSource[right] > value {
                right -= 1
            } else {
                left += 1
            }
        }
        
        return false
    }
    
}

let dataStructure = TwoSumDataStructure()
dataStructure.hashAdd(1)
dataStructure.hashAdd(3)
dataStructure.hashAdd(5)
let resultValue = dataStructure.hashFind(4)
let resultValue2 = dataStructure.hashFind(7)
print("result value ==> \(resultValue)")
print("result value2 ==> \(resultValue2)")



let numbsers = [5,25,75]
let target = 100

let result = TwoSumSort().doublePointsTwoSum(with: numbsers, target: target)
print("[\(result.first ?? -1), \(result.last ?? -1)]")
