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

enum TraversalType {
    case preoder
    case inorder
    case postorder
}

func preoderTraversal(_ root: TreeNode?) -> [Int] {
    guard let rootNode = root else { return [] }
    var result: [Int] = []
    dfs(rootNode, nodeValues: &result, traversalType: .preoder)
    return result
}

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let rootNode = root else { return [] }
    var result: [Int] = []
    dfs(rootNode, nodeValues: &result, traversalType: .inorder)
    return result
}

func postorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let rootNode = root else { return [] }
    var result: [Int] = []
    dfs(rootNode, nodeValues: &result, traversalType: .postorder)
    return result
}

private func dfs(_ root: TreeNode?, nodeValues: inout [Int], traversalType type: TraversalType) {
    guard let rootNode = root else { return }
    if type == .preoder { // 前序遍历，根节点放在 left，right 递归前
        nodeValues.append(rootNode.value)
    }
    if let left = rootNode.left {
        nodeValues.append(left.value)
        dfs(left, nodeValues: &nodeValues, traversalType: type)
    }
    if type == .inorder { // 中序遍历，根节点放在 left，right 中间
        nodeValues.append(rootNode.value)
    }
    if let right = rootNode.right {
        nodeValues.append(right.value)
        dfs(right, nodeValues: &nodeValues, traversalType: type)
    }
    if type == .postorder { // 后续遍历，根节点放在 left，right 后面
        nodeValues.append(rootNode.value)
    }
}

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
 
 递归遍历，秩序要根据不同的遍历，把根节点放到 left， right 节点递归的不同位置即可。
 */

