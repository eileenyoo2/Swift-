//
//  main.swift
//  Greedy-Q2
//
//  Created by sapere4ude on 2020/12/15.
//

// [이것이 코딩테스트다. 그리디 Q1]

import Foundation

// 값을 입력받고 그것을 Int로 바꿔주기
var input = readLine()!.map { String($0) }
var s = input.map { Int($0)! }
var result = 0

for i in 0 ..< s.count {
    if s[i] <= 1 || result <= 1 {
        result += s[i]
    }
    else {
        result *= s[i]
    }
}

print(result)


