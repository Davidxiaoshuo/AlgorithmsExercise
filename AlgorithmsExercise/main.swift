//
//  main.swift
//  alg-exercise
//
//  Created by 薄海硕 on 2020/1/7.
//  Copyright © 2020 薄海硕. All rights reserved.
//

import Foundation

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

var nodeIndex: Int = -1
private func createTree(byIntArray nums: inout [Int?]) -> TreeNode? {
    guard !nums.isEmpty else { return nil }
    guard nodeIndex < nums.count - 1 else { return nil }
    
    nodeIndex += 1
    var root: TreeNode?
    if let value = nums[nodeIndex] {
        root = TreeNode(value: value)
    }
    root?.left = createTree(byIntArray: &nums)
    root?.right = createTree(byIntArray: &nums)
    return root
}

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

var nums = [3, 9, 20, nil, nil, 15, 7]
let tree = createTree(byIntArray: &nums)


let result = levelOrder(tree)
print(result)
