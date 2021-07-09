//
//  main.swift
//  alg-exercise
//
//  Created by 薄海硕 on 2020/1/7.
//  Copyright © 2020 薄海硕. All rights reserved.
//

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    var hashtable: [Character: Int] = [: ]
    var start: Int = 0
    var result: Int = 0
   
    let characters = Array(s)
    for i in 0..<characters.count {
        let tempCharacter = characters[i]
        if hashtable.keys.contains(tempCharacter) {
            start = max(hashtable[tempCharacter] ?? -1, start)
        }
        result = max(result, i - start + 1)
        hashtable[tempCharacter] = i + 1
    }
    return result
}

let inputStr = ""
let result = lengthOfLongestSubstring(inputStr)
print(result)
