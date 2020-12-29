//
//  main.swift
//  FailureRate
//
//  Created by sapere4ude on 2020/12/29.
//

// [프로그래머스 실패율]

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var fail = [Int: Double]()
    // 각 스테이지별 실패율 구하기
    // 실패율 저장하기
    
    for i in 1 ..< N+1 {
        // 스테이지에 도달한 플레이어 수
        let a = stages.filter { $0 >= i }.count
        // 스테이지에 도달하지 못한 플레이어 수
        let b = a - stages.filter { $0 > i }.count
        
        let failureRate = Double(b) / Double(a)
        
        fail[i] = failureRate
    }
    // 실패율이 높은 순서대로 내림차순 정렬
    let end = fail.sorted(by: <).sorted(by: { $0.value > $1.value })
    let result = end.map { $0.key }
    
    return result
}


