import Cocoa

/// https://leetcode-cn.com/problems/add-two-numbers/
/// 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
/// 请你将两个数相加，并以相同形式返回一个表示和的链表。
/// 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

/// 示例 1：
/// 输入：l1 = [2,4,3], l2 = [5,6,4]
/// 输出：[7,0,8]
/// 解释：342 + 465 = 807.

/// 示例 2：
/// 输入：l1 = [0], l2 = [0]
/// 输出：[0]
///示例 3：

/// 输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
/// 输出：[8,9,9,9,0,0,0,1]

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

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if nil == l1, nil == l2 { return nil }
    
    var first = l1, second = l2
    
    var head: ListNode?
    var tail: ListNode?
    var carry: Int = 0
    while nil != first || nil != second {
        let n1 = nil != first ? first?.value ?? 0 : 0
        let n2 = nil != second ? second?.value ?? 0 : 0
        let sum: Int = n1 + n2 + carry
        if nil == head {
            head = ListNode(value: sum % 10)
            tail = head
        } else {
            tail?.next = ListNode(value: sum % 10)
            tail = tail?.next
        }
        carry = sum / 10
        
        if nil != first {
            first = first?.next
        }
        
        if nil != second {
            second = second?.next
        }
    }
    
    if carry > 0 {
        tail?.next = ListNode(value: carry)
    }
    
    return head
}
 
let l1 = generateLinkedList(nums: [9,9,9,9,9,9,9])
print(listNode: l1, prefixString: "l1")

let l2 = generateLinkedList(nums: [9, 9, 9, 9])
print(listNode: l2)

let result = addTwoNumbers(l1, l2)
print(listNode: result)


/// 总结：sum = n1 + n2 + carry  两个位数相加再加进位
