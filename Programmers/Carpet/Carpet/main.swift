//
//  main.swift
//  Carpet
//
//  Created by kant on 2021/01/05.
//

// [프로그래머스 카펫]

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let sum = brown + yellow
    var x = Int()
    var y = Int()
    
    for i in 1 ... sum {
        if sum % i == 0 {
            x = sum / i
            y = i
        }
        
        if (x - 2) * (y - 2) == yellow {
            break
        }
    }
    return [x,y]
}


print(solution(10, 2))
print(solution(8, 1))
