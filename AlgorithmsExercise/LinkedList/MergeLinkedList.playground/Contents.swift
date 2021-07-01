import Cocoa

/// 题型：合并两个有序链表


/// 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
///
/// 示例 1：
/// 输入：l1 = [1,2,4], l2 = [1,3,4]
/// 输出：[1,1,2,3,4,4]
///
/// 示例 2：
/// 输入：l1 = [], l2 = []
/// 输出：[]

/// 示例 3：
/// 输入：l1 = [], l2 = [0]
/// 输出：[0]

class ListNode {
    
    var value: Int
    var next: ListNode?
    
    init(value: Int = 0, next: ListNode? = nil) {
        self.value = value
        self.next = next
    }
}

func generateLinkedList(nums: [Int]) -> ListNode? {
    if nums.isEmpty {
        return nil
    }
    var head: ListNode?
    var list: ListNode?
    for num in nums {
        if nil == head {
            head = ListNode(value: num)
            list = head
        } else {
            list?.next = ListNode(value: num)
            list = list?.next
        }
    }
    return head
}

func print(listNode node: ListNode?, prefixString: String = "") {
    guard let node = node else {
        print("\(prefixString) node is nil")
        return
    }
    var tempNode: ListNode? = node
    while nil != tempNode {
        print("\(prefixString) node value ==> \(tempNode?.value ?? -1)")
        tempNode = tempNode?.next
    }
    print("\n")
}

/// 迭代法
/// 注意：注意题意，两个 `升序` 链表
/// 要点：① 两条线，但每次只迭代一个节点
///       ② 其中一条线结束，循环结束
///       ③ 最后会有一条线没有结束，把没有结束的那条线的剩余节点，拼接到新链表 next 位置。
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if nil == l1, nil == l2 { return nil }
    if nil == l1, nil != l2 { return l2 }
    if nil != l1, nil == l1 { return l1 }
    
    var list1 = l1, list2 = l2
    let newList: ListNode? = ListNode(value: -1)
    var prevList: ListNode? = newList
    while nil != list1, nil != list2 {
        if list1!.value <= list2!.value {
            prevList?.next = list1
            list1 = list1?.next
        } else {
            prevList?.next = list2
            list2 = list2?.next
        }
        prevList = prevList?.next
    }
    prevList?.next = nil == list1 ? list2 : list1
    return newList?.next
}

/// 递归法
/// 注意：注意题意，两个 `升序` 链表
/// 要点： ① 先写 return 值；需要谁，返回谁，谁「②」往下走一步
///        ③ next 赋值即往下拼接形成新链表。
func mergeTwoLists1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if nil == l1 {
        return l2
    } else if nil == l2 {
        return l1
    } else if l1!.value < l2!.value {
        l1?.next = mergeTwoLists(l1?.next, l2) // ②
        return l1 // ① 先写 return 值；需要谁，返回谁，谁「②」往下走一步
    } else {
        l2?.next = mergeTwoLists(l1, l2?.next)
        return l2
    }
}


let firstListNode = generateLinkedList(nums: [1, 2, 4])
print(listNode: firstListNode, prefixString: "first")

let secondListNode = generateLinkedList(nums: [1, 3, 4, 5, 8, 9])
print(listNode: secondListNode, prefixString: "second")

let mergedListNode = mergeTwoLists1(firstListNode, secondListNode)
print(listNode: mergedListNode, prefixString: "merged")
