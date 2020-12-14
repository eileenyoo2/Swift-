//
//  main.swift
//  Greedy-Q1
//
//  Created by sapere4ude on 2020/12/15.
//

// [이것이 코딩테스트다. 그리디 Q03]

// 경우의 수는 두가지 밖에 없으므로 필요한 뒤집기 횟수를 모두 구하여 더 작은 것을 선택하는 것이 핵심

import Foundation

var input = readLine()!.map() {String($0)}
var countZero: Int = 0
var countOne: Int = 0
var resultCount = 0

if input[0] == "0"{
    countZero = 1
} else {
    countOne = 1
}

for i in 1 ... input.count - 1 {
    if input[i] != input[i - 1] {
        if input[i] == "0" {
            countZero += 1
        }
        else {
            countOne += 1
        }
    }
}

if countZero >= countOne {
    print(countOne)
} else {
    print(countZero)
}




