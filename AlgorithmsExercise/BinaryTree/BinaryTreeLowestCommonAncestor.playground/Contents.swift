import Cocoa

/**
    给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

    百度百科中最近公共祖先的定义为：“对于有根树 T 的两个节点 p、q，最近公共祖先表示为一个节点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

    来源：力扣（LeetCode）
    链接：https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree
     
    示例 1：
    输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
    输出：3
    解释：节点 5 和节点 1 的最近公共祖先是节点 3 。

    示例 2：
    输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
    输出：5
    解释：节点 5 和节点 4 的最近公共祖先是节点 5 。因为根据定义最近公共祖先节点可以为节点本身。

 */

// 定义二叉树数据结构
class TreeNode {
    
    var value: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(
        value: Int = 0,
        left: TreeNode? = nil,
        right: TreeNode? = nil
    ) {
        self.value = value
        self.left = left
        self.right = right
    }
}

private var parent: [Int: TreeNode] = [: ]
private var visitorArray: [Int] = []

private func dfs(root: TreeNode?) {
    guard let rootNode = root else { return }
    if let left = rootNode.left {
        print("left --> \(left.value)")
        parent[left.value] = root
        dfs(root: left) // 递归比遍历 left 树
    }
    
    if let right = rootNode.right {
        print("right --> \(right.value)")
        parent[right.value] = root
        dfs(root: right) // 递归比遍历 right 树
    }
}

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    dfs(root: root)
    var pNode: TreeNode? = p
    while nil != pNode {
        visitorArray.append(pNode!.value)
        pNode = parent[pNode!.value]
    }
    
    var qNode: TreeNode? = q
    while nil != qNode {
        if visitorArray.contains(qNode!.value) {
            return qNode
        }
        qNode = parent[qNode!.value]
    }
    
    return nil
}

/// create test tree -> [3,5,1,6,2,0,8,null,null,7,4]
func createTree() -> (root: TreeNode, pNode: TreeNode, qNode: TreeNode) {
    
    let rootNode = TreeNode(value: 3)
    
    let level_1_left = TreeNode(value: 5)
    let level_1_right = TreeNode(value: 1)
    
    rootNode.left = level_1_left
    rootNode.right = level_1_right
    
    let level_2_1_left = TreeNode(value: 6)
    let level_2_1_right = TreeNode(value: 2)
    
    level_1_left.left = level_2_1_left
    level_1_left.right = level_2_1_right
    
    let level_2_2_left = TreeNode(value: 0)
    let level_2_2_right = TreeNode(value: 8)
    
    level_1_right.left = level_2_2_left
    level_1_right.right = level_2_2_right
    
    let level_3_2_left = TreeNode(value: 7)
    let level_3_2_right = TreeNode(value: 4)
    
    level_2_1_right.left = level_3_2_left
    level_2_1_right.right = level_3_2_right
    return (rootNode, level_1_left, level_3_2_right)
}


let nodes = createTree()
let commontParentAncestor = lowestCommonAncestor(nodes.root, nodes.pNode, nodes.qNode)
print(commontParentAncestor?.value ?? -1)

/// 题解：1. 从根节点开始遍历整棵二叉树，用哈希表记录每个节点的父节点指针。这里采用 DFS，深度优先遍历。
/// 2. 从 p 节点开始不断往它的祖先移动，并用数据结构记录已经访问过的祖先节点。
/// 3. 同样，我们再从 q 节点开始不断往它的祖先移动，如果有祖先已经被访问过，即意味着这是 p 和 q 的深度最深的公共祖先，即 LCA 节点。
