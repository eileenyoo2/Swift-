//
//  main.swift
//  Exam
//
//  Created by sapere4ude on 2020/12/28.
//

// [프로그래머스 모의고사]

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    
    let student1 = [1,2,3,4,5]
    let student2 = [2,1,2,3,2,4,2,5]
    let student3 = [3,3,1,1,2,2,4,4,5,5]

    var score1 = 0
    var score2 = 0
    var score3 = 0
    
    // 배열의 index를 활용하는 것이 포인트 & 배열의 크기+1 를 활용하여 index를 전부 돌게 하는 것이 포인트
    answers.enumerated().forEach { (index, element) in
        if element == student1[index % 5] {
            score1 += 1
        }
        if element == student2[index % 8] {
            score2 += 1
        }
        if element == student3[index % 10] {
            score3 += 1
        }
    }
    
    let maxScore = max(max(score1,score2),score3)
    
    var result = [Int]()
    
    if maxScore == score1 {
        result.append(1)
    }
    if maxScore == score2 {
        result.append(2)
    }
    if maxScore == score3 {
        result.append(3)
    }
    
    return result
}

print(solution([1,2,3,4,5]))
