//
//  main.swift
//  Implement-Q7
//
//  Created by sapere4ude on 2020/12/16.
//

// MARK: - [이것이 코딩테스트다. Q7]

import Foundation

// 사용자로부터 받은 점수를 Int형으로 변환
var input = readLine()!.map {String($0)}
var check = input.map {Int($0)!}
var result = 0

// 받아온 점수값의 총 자리수
var length = input.count

// 왼쪽 부분의 자릿수 합 더하기
for i in 0 ..< length/2 {
    result += check[i]
}

// 오른쪽 부분의 자릿수 합 더하기
for i in length/2 ..< length {
    print("i-->\(i)")
    result -= check[i]
}

if result == 0 {
    print("LUCKY")
}
else {
    print("READY")
}
