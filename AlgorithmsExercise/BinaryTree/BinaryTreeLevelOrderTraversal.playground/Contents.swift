import Cocoa

/**
 给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。
 
 示例：
 二叉树：[3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其层序遍历结果：

 [
   [3],
   [9,20],
   [15,7]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-level-order-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
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


/// 按层遍历，每一层所有节点，组成一个 array 返回
/// - Parameter root: 根节点
/// - Returns: 所有层级的分组集合 [[Int]]
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let rootNode = root else { return [] }
    var result: [[Int]] = []
    
    var queue: [TreeNode] = []
    queue.append(rootNode)
    
    while queue.count > 0 {
        var currLevelNodes: [Int] = []
        
        for _ in 0..<queue.count {
            let currTree = queue.removeFirst()
            currLevelNodes.append(currTree.value)
            
            if let left = currTree.left {
                queue.append(left)
            }
            
            if let right = currTree.right {
                queue.append(right)
            }
        }
        result.append(currLevelNodes)
    }
    
    return result
}

/**
 题解：
 1. 注意此题是需要把，每一个层级所有节点组成一个数组。不是按每个节点下的子节点分组
 2. 时间复杂度：每个点进队出队各一次，故渐进时间复杂度为 O(n)；空间复杂度：队列中元素的个数不超过 n 个，故渐进空间复杂度为  O(n)
 3. 遍历方法，BFS「Breadth First Search」宽度优先搜索
 */
