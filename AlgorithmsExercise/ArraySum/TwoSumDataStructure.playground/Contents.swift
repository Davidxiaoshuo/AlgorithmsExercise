import Cocoa

/// 两数之和 - 数据结构
/// https://leetcode-cn.com/problems/two-sum-iii-data-structure-design/
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

    var dataSource: [Int] = []
    
    init() { }
    
    // MAKR: -  Hashtable 解法
    
    /// number: count
    var hashtable: [Int: Int] = [: ]
    
    func hashAdd(_ number: Int) {
        if hashtable.keys.contains(number) {
            hashtable[number]! += 1
            return
        }
        hashtable[number] = 1
    }
    
    func hashFind(_ value: Int) -> Bool {
        for (mapValue, times) in hashtable {
            let diffValue = value - mapValue
            if diffValue != mapValue {
                if hashtable.keys.contains(diffValue) {
                    return true
                }
            } else {
                if times > 1 {
                    return true
                }
            }
        }
        return false
    }
    
    // MAKR: 双指针解法
    
    var isSort: Bool = false
    
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

/**
 
解法总结：
 1. hashtable 解法，hashtable 的 key 为 num， value 为 num 出现次数 count。
    add 方法中判断 key 是否存在，存在 count + 1.
    find 方法中 diffValue 是否与遍历 value 相等，相等，count > 1 则证明存在，返回 true；不相等， diffValue 是否存在 hashtable 中，存在则返回 true

 2. 双指针解法，关键在于 nums 需为升序数组
    add 方法需注意，isSort 需要被重置
    find 方法中，需要将数组排序 sort 后再进行双指针遍历。
 */
