//
//  main.swift
//  targetNumber
//
//  Created by sapere4ude on 2020/12/19.
//

// [프로그래머스 타겟넘버]
// 문제링크 : https://programmers.co.kr/learn/courses/30/lessons/43165

import Foundation

var numbersCopy = [Int]()   // numbers의 값을 저장할 변수
var targetCopy = 0          // target 값을 저장할 변수
var count = 0               // 방법의 수를 저장할 변수
 

// numbers의 숫자들을 차례로 +,- 두가지 모두를 실행시키도록 하여 깊이가 numbers의 개수에 도달하면 반환하도록 하는 재귀함수를 만들어 준다.
func dfs(_ depth: Int, _ sum: Int) {
    
    // numbers의 갯수에 도달했을때 taget의 값과 같다면 방법의 수를 증가시킨다
    if depth == numbersCopy.count {
        if sum == targetCopy {
            count += 1
        }
        return
    }
    // depth의 크기를 증가시키고 재귀적으로 함수에 다시 접근한다.
    dfs(depth + 1, sum + numbersCopy[depth])
    dfs(depth + 1, sum - numbersCopy[depth])
    
}
 
func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    numbersCopy = numbers
    targetCopy = target
    dfs(0, 0)
    
    return count
}


