//
//  main.swift
//  Greedy-Q1
//
//  Created by sapere4ude on 2020/12/15.
//

import Foundation

// [이것이 코딩테스트다. 그리디 Q1]

var PeopleCount = Int(readLine()!)!
var data = readLine()!.split(separator: " ").map { String($0) }

data.sort()

var result = 0  // 그룹의 수
var count = 0   // 현재 그룹에 포함된 모험가 수

// 공포도를 낮은 것 부터 확인
for i in 0 ..< data.count {
    count += 1  // 모험가 한명 포함
    if count >= i { // 현재 그룹에 포함된 모험가의 수가 현재의 공포도 이상이라면? -> 그룹 결성
        result += 1 // 총 그룹의 수 증가
        count = 0   // 현재 그룹에 포함된 모험가의 수 초기화
    }
}

print(result)   // 그룹의 수 추가


