import Cocoa
import Foundation

var greeting = "wellcome link list exercise ~"
print(greeting)
print("\n")
/// 链表：链表（Linked list）是一种常见的基础数据结构，是一种线性表，但是并不会按线性的顺序存储数据，而是在每一个节点里存到下一个节点的指针(Pointer)。由于不必须按顺序存储，链表在插入的时候可以达到O(1)的复杂度，比另一种线性表顺序表快得多，但是查找一个节点或者访问特定编号的节点则需要O(n)的时间，而顺序表相应的时间复杂度分别是O(logn)和O(1)。


/// 给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。
/// https://leetcode-cn.com/problems/reverse-linked-list/
/// 示例 1：
/// 输入：head = [1,2,3,4,5]
/// 输出：[5,4,3,2,1]

class ListNode {

    var value: Int
    var next: ListNode?

    init(_ value: Int) {
        self.value = value
    }
}

/// 迭代法
/// null  ->  1  ->  2  ->  3  ->  4  ->  5  -> null   ①
/// pre      cur     nxt                               ②
///          pre     cur    nxt                        ③
/// null  <-  1  <-  2  <-  3  <-  4  <-  5            ④
func reverseList(_ head: ListNode?) -> ListNode? {
    var preNode: ListNode? = nil
    var currentNode: ListNode? = head

    while nil != currentNode {
        let nextNode: ListNode? = currentNode?.next
        currentNode?.next = preNode
        preNode = currentNode
        currentNode = nextNode
    }
    return preNode
}

/// 递归法
/// head -> next -> next = head
func reverseListRecursion(_ head: ListNode?) -> ListNode? {
    if nil == head?.next {
        return head
    }
    let newHeader = reverseListRecursion(head?.next)
    
    head?.next?.next = head
    head?.next = nil
    return newHeader
}

/// 根据链表特性，生成链表
func generateLinkedList(by input: [Int]) -> ListNode? {
    var index = 0
    var head: ListNode?
    var list: ListNode?
    while index < input.count {
        if nil == head {
            head = ListNode(input[index])
            list = head
        } else {
            list?.next = ListNode(input[index])
            list = list?.next
        }
        index += 1
    }
    return head
}

func print(listNode: ListNode?) {
    guard let node = listNode else { return }
    var tempNode: ListNode? = node
    while nil != tempNode {
        print(tempNode?.value ?? "nil")
        tempNode = tempNode?.next
    }
}

let input = [1, 2, 3, 4, 5]
let listNode = generateLinkedList(by: input)
let newListNode = reverseListRecursion(listNode)
print(listNode: newListNode)
