import Cocoa

/// 给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。
/// k 是一个正整数，它的值小于或等于链表的长度。
/// 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

/// 进阶：
/// 你可以设计一个只使用常数额外空间的算法来解决此问题吗？
/// 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。

/// 示例 1：
/// 输入：head = [1,2,3,4,5], k = 2
/// 输出：[2,1,4,3,5]

/// 示例 2：
/// 输入：head = [1,2,3,4,5], k = 3
/// 输出：[3,2,1,4,5]

/// 示例 3：
/// 输入：head = [1,2,3,4,5], k = 1
/// 输出：[1,2,3,4,5]

class ListNode {

    var value: Int
    var next: ListNode?
    
    init(_ value: Int = 0, _ next: ListNode? = nil) {
        self.value = value
        self.next = next
    }
}

func generateSerialListNode(_ num: Int) -> ListNode? {
    if num <= 0 { return nil }
    var headNode: ListNode?
    var indexNode: ListNode?
    for index in 1...num {
        if nil == headNode {
            headNode = ListNode(index)
            indexNode = headNode
        } else {
            indexNode?.next = ListNode(index)
            indexNode = indexNode?.next
        }
    }
    return headNode
}

/// 递归法
/// head -> next -> sublist
func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    var nextHead = head
    var step: Int = 0
    while step < k {
        if nil == nextHead {
            return head
        }
        step += 1
        nextHead = nextHead?.next
    }
    print("reverse...before head value = \(head?.value ?? -1)")
    let sublist = reverseKGroup(nextHead, k)
    print("reverse...after head value = \(head?.value ?? -1)")
    
    let newHead = reverseKTop(head, k)
    // 因此head指向的节点的后继指针指向subList
    head?.next = sublist
    return newHead
}

/// 迭代法
/// null  ->  1  ->  2  ->  3  ->  4  ->  5  -> null   ①
/// pre      cur     nxt                               ②
///          pre     cur    nxt                        ③
/// null  <-  1  <-  2  <-  3  <-  4  <-  5            ④
func reverseKTop(_ head: ListNode?, _ k: Int) -> ListNode? {
    var preNode: ListNode?
    var currentNode: ListNode? = head
    for _ in 0..<k {
        let nextNode = currentNode?.next
        currentNode?.next = preNode
        preNode = currentNode
        currentNode = nextNode
    }
    return preNode
}

let listNode = generateSerialListNode(5)
var tempNode: ListNode? = listNode
while nil != tempNode {
    print("list node value = \(tempNode?.value ?? -1)")
    tempNode = tempNode?.next
}

let reversedList = reverseKGroup(listNode, 3)
var tempReversedList: ListNode? = reversedList
while nil != tempReversedList {
    print("list node value = \(tempReversedList?.value ?? -1)")
    tempReversedList = tempReversedList?.next
}


/// 总结：① 将整体拆分成小步骤
/// 1 -> 2 ->       3 -> 4 ->       5
/// 2 -> 1 ->       4 -> 3 ->       5
/// ② 链表采用递归法 + 迭代法
/// ③ 迭代，注意指针指向，中间变量 nextNode 是关键。
