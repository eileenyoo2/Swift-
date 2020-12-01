//
//  main.swift
//  insertSort
//
//  Created by sapere4ude on 2020/12/01.
//

// MARK: - 삽입정렬

import Foundation

// Comparable : 배열 목록의 개별 요소를 비교하기 위해 사용되는 프로토콜
func insertSort<T: Comparable>(_ array: [T], compare:(T,T) -> Bool) -> [T] {
    
    var sorted: [T] = []
    
    for i in array {
        sorted.append(i)
        var currentIndex = sorted.count - 1
        
        // sorted[currentIndex], sorted[currentIndex-1] 의 값 교환
        // currentIndex 값이 0보다 크다면 계속해서 돌게 됨(while을 사용했기 때문에)
        while currentIndex > 0, compare(sorted[currentIndex], sorted[currentIndex-1]) {
            let temp = sorted[currentIndex]
            sorted[currentIndex] = sorted[currentIndex - 1]
            sorted[currentIndex - 1] = temp
            currentIndex -= 1
        }
    }
    return sorted
}

var insertArray = readLine()!.components(separatedBy: " ").map( {Int($0)!})

print(insertSort(insertArray, compare: {$0 < $1}))
