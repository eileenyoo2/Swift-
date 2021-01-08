//
//  main.swift
//  FindPrimeNumber
//
//  Created by sapere4ude on 2021/01/08.
//

// [프로그래머스 소수찾기]

import Foundation

func solution(_ n:Int) -> Int {
    var count = 1
    var check = 0
    
    for x in 3 ..< n+1 {
        for i in  1 ..< x+1 {
            print("x, i ---> \(x), \(i)")
            if x % i == 0 {
                check += 1
                print("check: \(check)")
            }
        }
        if check == 2 {
            count += 1
            print("count: \(count)")
            check = 0
        } else {
            print("소수가 아냐, count: \(count)")
            check = 0
        }
    }
    return count
}

print(solution(10))
