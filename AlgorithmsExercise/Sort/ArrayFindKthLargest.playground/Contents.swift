import Cocoa

/// 在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
/// 示例 1:
/// 输入: [3,2,1,5,6,4] 和 k = 2
/// 输出: 5

/// 示例 2:
/// 输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
/// 输出: 4

/// 说明: 你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。

/// 利用系统函数
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    return nums.sorted().reversed()[k-1]
}

/// 自定义排序
func findKthLargestWithCustomSort(_ nums: [Int], _ k: Int) -> Int {
    var sortNums = nums
//    quickSort(nums: &sortNums)
//    bubbleSort(nums: &sortNums)
    insertionSort(nums: &sortNums)
    return sortNums.reversed()[k-1]
}


/// MARK: - 冒泡排序
func bubbleSort(nums: inout [Int]) {
    if nums.count <= 1 { return }
    for i in 0...nums.count - 2 {
        for j in i + 1...nums.count - 1 {
            if nums[j] < nums[i] {
                nums.swapAt(i, j)
            }
        }
    }
}

/// MARK: - 插入排序
func insertionSort(nums: inout [Int]) {
    if nums.count <= 1 { return }
    for i in 1..<nums.count {
        var j = i
        let temp = nums[j]
        while j > 0, temp < nums[j - 1] {
//            nums.swapAt(j, j - 1)
            nums[j] = nums[j-1]
            j -= 1
        }
        nums[j] = temp
    }
}


/// MARK: - 快速排序, 效率较低
private func partition(nums: inout [Int], left: Int, right: Int) -> Int{
    // 找出分界值，通常取数组末尾一位
    let pivot = nums[right]
    var i = left
    for j in left...right {
        if nums[j] < pivot {
            nums.swapAt(i, j)
            i += 1
        }
    }
    nums.swapAt(right, i)
    return i
}

private func quickSort(nums: inout [Int], left: Int, right: Int) {
    if left >= right { return }
    let q = partition(nums: &nums, left: left, right: right)
    quickSort(nums: &nums, left: left, right: q - 1)
    quickSort(nums: &nums, left: q + 1 , right: right)
}

func quickSort(nums: inout [Int]) {
    quickSort(nums: &nums, left: 0, right: nums.count - 1)
}

extension Array {
    var decompose : (head: Element, tail: [Element])? {
        return (count > 0) ? (self[0], Array(self[1..<count])) : nil
    }
}

func quickSort(input: [Int]) -> [Int] {
    if let (pivot, rest) = input.decompose {
        let lesser = rest.filter { $0 < pivot }
        let greater = rest.filter { $0 >= pivot }
        let a = quickSort(input: lesser) + [pivot]
        let b = a + quickSort(input: greater)
        return b
    } else {
        return []
    }
}


/// MARK: - 输出

let num = findKthLargestWithCustomSort([3,2,3,1,2,4,5,5,6], 4)
print("num ==> \(num)")

var bubbleNums = [3,2,3,1,2,4,5,5,6]
bubbleSort(nums: &bubbleNums)
print("bubble sort nums => \(bubbleNums)")

var insertionNums = [3,2,3,1,2,4,5,5,6]
insertionSort(nums: &insertionNums)
print("insertion sort nums => \(insertionNums)")

var quickNums =  [3,2,3,1,2,4,5,5,6]
quickNums = quickSort(input: quickNums)
print("quick sort nums => \(quickNums)")
