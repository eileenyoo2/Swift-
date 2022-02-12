//
//  main.swift
//  Camouflage
//
//  Created by sapere4ude on 2020/12/26.
//

// [프로그래머스 위장]

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var typeCount = [String:Int]()   // [Key : Value] 형태로 '딕셔너리' 선언
    
    for cloth in clothes {
        if typeCount[cloth[1]] != nil {
            typeCount[cloth[1]]! += 1
        } else {
            typeCount[cloth[1]] = 1
        }
    }
    
    var count:Int = 1
    
    for (_, value) in typeCount {
        count = count * (value + 1)
    }
    
    return count - 1
}

print(solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]))


