import Cocoa

/// 给你两个单链表的头节点 headA 和 headB ，请你找出并返回两个单链表相交的起始节点。如果两个链表没有交点，返回 null 。
/// 题目数据 保证 整个链式结构中不存在环。
///注意，函数返回结果后，链表必须 保持其原始结构 。

///示例 1：
/// 输入：intersectVal = 8, listA = [4,1,8,4,5], listB = [5,0,1,8,4,5], skipA = 2, skipB = 3
/// 输出：Intersected at '8'
/// 解释：相交节点的值为 8 （注意，如果两个链表相交则不能为 0）。
/// 从各自的表头开始算起，链表 A 为 [4,1,8,4,5]，链表 B 为 [5,0,1,8,4,5]。
/// 在 A 中，相交节点前有 2 个节点；在 B 中，相交节点前有 3 个节点。

/// 示例 2：
/// 输入：intersectVal = 2, listA = [0,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
/// 输出：Intersected at '2'
/// 解释：相交节点的值为 2 （注意，如果两个链表相交则不能为 0）。
/// 从各自的表头开始算起，链表 A 为 [0,9,1,2,4]，链表 B 为 [3,2,4]。
/// 在 A 中，相交节点前有 3 个节点；在 B 中，相交节点前有 1 个节点。

/// 示例 3：
/// 输入：intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2
/// 输出：null
/// 解释：从各自的表头开始算起，链表 A 为 [2,6,4]，链表 B 为 [1,5]。
/// 由于这两个链表不相交，所以 intersectVal 必须为 0，而 skipA 和 skipB 可以是任意值。
/// 这两个链表不相交，因此返回 null 。

class ListNode {
    
    var value: Int
    var next: ListNode?
    
    init(_ value: Int = 0, _ next: ListNode? = nil) {
        self.value = value
        self.next = next
    }
}

/// 根据题意，生成出所需的 ListNode。
/// - Parameters:
///   - ownerNum: 链表自己部分的节点个数
///   - commonNodes: 公共节点
/// - Returns: 返回一个新的链表
func generateLinkedList(ownerNums: [Int], withCommonNode commonNode: ListNode? = nil) -> ListNode? {
    var head: ListNode?
    var node: ListNode?
    for num in ownerNums {
        if nil == head {
            head = ListNode(num)
            node = head
        } else {
            node?.next = ListNode(num)
            node = node?.next
        }
    }
    if nil != commonNode {
        node?.next = commonNode
    }
    return head
}

/// 打印每个节点的值，辅助方法
/// - Parameters:
///   - node: head node
///   - prefixStr: 输出前缀
func printListItemValue(node: ListNode, prefixStr: String) {
    var tempNode: ListNode? = node
    while nil != tempNode {
        print("\(prefixStr) node value ==> \(tempNode?.value ?? -1)")
        tempNode = tempNode?.next
    }
    print("\n")
}

/// 双指针，移动指针。时间复杂度 O(m+n)
func getIntersectionNodeByDoublePoint(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {

    if nil == headA || nil == headB {
        return nil
    }

    var tempHeadA: ListNode? = headA
    var tempHeadB: ListNode? = headB

    while tempHeadA !== tempHeadB {
        tempHeadA = tempHeadA == nil ? headB : tempHeadA?.next
        tempHeadB = tempHeadB == nil ? headA : tempHeadB?.next
    }

    return tempHeadA
}

/// 暴力迭代，效率比较低 On2；数据量比较大，会超时限
func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {

    if nil == headA || nil == headB {
        return nil
    }
    
    if headA === headB {
        return headA
    }

    var tempHeadA: ListNode? = headA
    
    while nil != tempHeadA {
        var tempHeadB: ListNode? = headB
        while nil != tempHeadB {
            if tempHeadA === tempHeadB {
                return tempHeadA
            }
            tempHeadB = tempHeadB?.next
        }
        tempHeadA = tempHeadA?.next
    }
    
    return tempHeadA
}


let commonNode = generateLinkedList(ownerNums: [8, 4, 5])
printListItemValue(node: commonNode!, prefixStr: "common")

let listA = generateLinkedList(ownerNums: [4, 1], withCommonNode: commonNode)
printListItemValue(node: listA!, prefixStr: "listA")

let listB = generateLinkedList(ownerNums: [5, 0, 1], withCommonNode: commonNode)
printListItemValue(node: listB!, prefixStr: "listB")

if let newList = getIntersectionNodeByDoublePoint(listA, listB) {
    printListItemValue(node: newList, prefixStr: "intersection")
} else {
    print("null")
}
