//
//  main.swift
//  SelectTwoAndSum
//
//  Created by sapere4ude on 2020/12/27.
//

// [프로그래머스 두 개 뽑아서 더하기]

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    var dic = [Int:Bool]()
    
    // 이중for문 사용. 인덱스가 서로 다른 두 수의 합의 경우를 완전 탐색
    for idx in 0 ..< numbers.count-1 {
        for jdx in idx+1 ..< numbers.count {
            dic[numbers[idx] + numbers[jdx]] = true
        }
    }
    return dic.map { $0.key }.sorted()  // 딕셔너리에서 sorted() 사용하면 기본적으로 배열로 반환
}



