//
//  main.swift
//  H-Index
//
//  Created by sapere4ude on 2020/12/26.
//

// [프로그래머스. H-Index]

import Foundation

func solution(_ citations:[Int]) -> Int {
    // 내림차순으로 정렬하고 그것을 (index, cit) 의 쌍으로 가져오는 것
    for (index, cit) in citations.sorted(by: >).enumerated() {
        print(index, cit)
        if index >= cit {
            return index
        }
    }
    return citations.count
}


//func solution(_ citations: [Int]) -> Int {
//    var sorted = citations.sorted(by:>)
//    for h in (1...sorted.count).reversed() {
//        print(h)
//        if sorted[h-1] >= h {
//            return h
//        }
//    }
//    return 0
//}

// 2022.02.13 풀이 추가 (한 곳에서 테스트 오류났음)
//func solution(_ citations: [Int]) -> Int {
//
//    var array:[Int] = citations
//    var h = 0
//    _ = array.sort()
//    array = array.reversed()
//
//    for h in 0 ... array.count-1 {
//        if array[h] <= h {
//            return h
//        }
//    }
//    return 0
//}




print(solution([3,0,6,1,5]))








