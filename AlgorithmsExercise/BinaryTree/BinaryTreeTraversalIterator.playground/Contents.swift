import Cocoa

import Cocoa

/**
 https://leetcode-cn.com/problems/binary-tree-preorder-traversal/
 https://leetcode-cn.com/problems/binary-tree-postorder-traversal/
 给你二叉树的根节点 root ，返回它节点值的 前序 遍历。
 
 示例 1：
 输入：root = [1,null,2,3]
 输出：[1,2,3]
 
 示例 2：
 输入：root = []
 输出：[]
 
 示例 3：
 输入：root = [1]
 输出：[1]
 
 示例 4：
 输入：root = [1,2]
 输出：[1,2]
 
 示例 5：
 输入：root = [1,null,2]
 输出：[1,2]
 */

class TreeNode {
    
    var value: Int = 0
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ value: Int, left: TreeNode? = nil, right: TreeNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}
func preorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    var stack: [TreeNode?] = [root]
    var result: [Int] = []
    while !stack.isEmpty {
        guard let node = stack.popLast() else { break }
        if let value = node?.value {
            result.append(value)
            stack.append(node?.right)
            stack.append(node?.left)
        }
    }
    return result
}

func preorderTraversal1(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    var stack: [TreeNode?] = []
    var result: [Int] = []
    var currentNode: TreeNode? = root
    while !stack.isEmpty || nil != currentNode {
        while nil != currentNode {
            if let value = currentNode?.value {
                result.append(value)
            }
            stack.append(currentNode)
            currentNode = currentNode?.left
        }
        if let node = stack.popLast() {
            currentNode = node?.right
        }
    }
    return result
}

func postorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    var stack: [TreeNode?] = [root]
    var result: [Int] = []
    while !stack.isEmpty {
        guard let node = stack.popLast() else { break }
        if let value = node?.value {
//            result.insert(value, at: 0)
            result.append(value)
            stack.append(node?.left)
            stack.append(node?.right)
        }
    }
    return result.reversed()
}

func postorderTraversal1(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    var stack: [TreeNode?] = []
    var result: [Int] = []
    var currentNode: TreeNode? = root
    while !stack.isEmpty || nil != currentNode {
        while nil != currentNode {
            if let value = currentNode?.value {
                result.append(value)
            }
            stack.append(currentNode)
            currentNode = currentNode?.right
        }
        if let node = stack.popLast() {
            currentNode = node?.left
        }
    }
    return result.reversed()
}

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    var stack: [TreeNode?] = []
    var result: [Int] = []
    var currNode: TreeNode? = root
    while !stack.isEmpty || nil != currNode {
        while nil != currNode {
            stack.append(currNode)
            currNode = currNode?.left
        }
        if let node = stack.popLast() {
            if let value = node?.value {
                result.append(value)
            }
            currNode = node?.right
        }
    }
    return result
}

private func createTree() -> TreeNode {
    let root = TreeNode(1)
    
    let level_1_left = TreeNode(2)
    let level_1_right = TreeNode(3)
    root.left = level_1_left
    root.right = level_1_right
    
    let level_2_1_left = TreeNode(4)
    let level_2_1_right = TreeNode(5)
    level_1_left.left = level_2_1_left
    level_1_left.right = level_2_1_right
    
    let level_2_2_left = TreeNode(6)
    let level_2_2_right = TreeNode(7)
    level_1_right.left = level_2_2_left
    level_1_right.right = level_2_2_right
    return root
}

let root = createTree()
let result = preorderTraversal1(root)
print(result)


/**
 1
 /  \
 2   3
 /\  /\
 4 5 6 7
 解题总结： https://leetcode-cn.com/problems/binary-tree-preorder-traversal/solution/tu-jie-er-cha-shu-de-si-chong-bian-li-by-z1m/
 如果你按照 根节点 -> 左孩子 -> 右孩子 的方式遍历，即「先序遍历」，每次先遍历根节点，遍历结果为 1 2 4 5 3 6 7；
 同理，如果你按照 左孩子 -> 根节点 -> 右孩子 的方式遍历，即「中序序遍历」，遍历结果为 4 2 5 1 6 3 7；
 如果你按照 左孩子 -> 右孩子 -> 根节点 的方式遍历，即「后序序遍历」，遍历结果为 4 5 2 6 7 3 1；
 最后，层次遍历就是按照每一层从左向右的方式进行遍历，遍历结果为 1 2 3 4 5 6 7。
 */

