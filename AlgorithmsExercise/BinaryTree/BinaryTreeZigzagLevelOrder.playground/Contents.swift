import Cocoa

/**
 
 https://leetcode-cn.com/problems/binary-tree-zigzag-level-order-traversal/
 
 给定一个二叉树，返回其节点值的锯齿形层序遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。
 
 例如：
给定二叉树 [3,9,20,null,null,15,7],
3
/ \
9  20
/  \
15   7
 
返回锯齿形层序遍历如下：
 [
   [3],
   [20,9],
   [15,7]
 ]
 
*/


/// 定义二叉树数据结构
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

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let rootNode = root else { return [] }
    
    var result: [[Int]] = []
    
    var queue: [TreeNode] = []
    queue.append(rootNode)
    
    var isLeftFrist: Bool = true
    while queue.count > 0 {
        var currLevelNodes: [Int] = []
        for _ in 0..<queue.count {
            let node: TreeNode = queue.removeFirst()
            if isLeftFrist { // 注意添加 level 节点的顺序
                currLevelNodes.append(node.value)
            } else {
                currLevelNodes.insert(node.value, at: 0)
            }
            if let left = node.left {
                queue.append(left)
            }
            
            if let right = node.right {
                queue.append(right)
            }
        }
        result.append(currLevelNodes)
        isLeftFrist = !isLeftFrist
    }
    
    return result
}

/**
 题解：
 1. 注意此题是需要把，每一个层级所有节点组成一个数组。不是按每个节点下的子节点分组
 2. 注意层节点添加 subarray 中元素的顺序
 3. 时间复杂度：每个点进队出队各一次，故渐进时间复杂度为 O(n)；空间复杂度：队列中元素的个数不超过 n 个，故渐进空间复杂度为  O(n)
 4. 遍历方法，BFS「Breadth First Search」宽度优先搜索
 */
