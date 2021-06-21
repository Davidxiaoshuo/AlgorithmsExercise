//
//  TwoSum.swift
//  alg-exercise
//
//  Created by 薄海硕 on 2020/1/7.
//  Copyright © 2020 薄海硕. All rights reserved.
//

import Foundation

class TwoSum {
    
    private func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()

        for (i, num) in nums.enumerated() {
            if let lastIndex = dict[target - num] {
                return [lastIndex, i]
            }

            dict[num] = i
        }
        fatalError("No valid outputs")
    }
    
    func printTwoSumResult(_ nums: [Int], _ target: Int) {
        let result = twoSum(nums, target)
        print(result)
    }
}
