//
//  main.swift
//  GymSuit
//
//  Created by sapere4ude on 2020/12/21.
//

// [프로그래머스 체육복]

import Foundation

// n: 전체 학생의 수, lost: 체육복을 도난당한 학생들의 번호가 담긴 배열, reverse: 여벌의 체육복을 가져온 학생들의 번호가 담긴 배열
func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var realLost = lost.sorted()
    var realReserve = reserve.sorted()
    var count = 0

    // 여분의 체육복을 도난당한 경우
    for i in 0..<realLost.count {
        for j in 0..<realReserve.count {
            if realLost[i] == realReserve[j] {
                realLost[i] = 0
                realReserve[j] = 0
                count += 1
                break
            }
        }
    }

    for num in 0..<realLost.count {
        for cloth in 0..<realReserve.count {
            if realReserve[cloth] == 0 || realLost[num] == 0 {
                continue
            } else if realLost[num]-1 == realReserve[cloth] ||
                        realLost[num]+1 == realReserve[cloth] {
                realReserve[cloth] = 0
                count += 1
                break
            }
        }
    }
    return n - lost.count + count
}




