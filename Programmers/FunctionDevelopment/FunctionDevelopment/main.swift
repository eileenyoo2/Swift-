//
//  main.swift
//  FunctionDevelopment
//
//  Created by sapere4ude on 2020/12/31.
//

// [프로그래머스 기능개발]

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var Q = [Int]()
    var answer = [Int]()
    
    // 반복문을 통해서 Q 배열에는 각각의 작업에 대한 작업완료 필요 일수가 들어감
    for idx in progresses.indices {
        Q.append((100 - progresses[idx] - 1) / speeds[idx] + 1)
    }

    var cur = 0
    
    while cur < Q.count {
        let nowDelay = Q[cur]
        var taskCnt = 0
        while cur < Q.count && Q[cur] <= nowDelay {
            taskCnt += 1
            cur += 1
        }
        answer.append(taskCnt)
    }
    
    return answer
}

print(solution([93,30,55], [1,30,5]))

