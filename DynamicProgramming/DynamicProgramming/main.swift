//
//  main.swift
//  DynamicProgramming
//
//  Created by sapere4ude on 2020/11/30.
//

import Foundation

// MARK: - Top-Down DynamicProgramming
// 피보나치 수열 소스코드 (재귀적)

var dp = Array(repeating: 0, count: 100) // 한번 계산된 결과를 메모이제이션(menoization)하기 위한 배열 초기화

func fiboTopDown(_ x: Int) -> Int {
    if x == 1 || x == 2 {
        return 1
    }
    if dp[x] != 0 {     // 이미 계산한 적 있는 문제라면 그대로 반환
        return dp[x]
    }
    
    dp[x] = fiboTopDown(x-1) &+ fiboTopDown(x-2)   // 아직 계산하지 않은 문제라면 점화식에 따라서 피보나치 결과 반환
    return dp[x]
}

print(fiboTopDown(5))

// MARK: - Bottom-Up DynamicProgramming
// 피보나치 수열 소스코드 (반복적)

func fiboBottomUp(_ x: Int) -> Int {
    dp[1] = 1
    dp[2] = 1
    
    for i in 3..<x+1 {
        dp[i] = dp[i-1] &+ dp[i-2]  // Swift runtime failure: arithmetic overflow 에러때문에 & 기호 붙였음
    }
    return dp[x]
}

print(fiboBottomUp(5))
