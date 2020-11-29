//
//  main.swift
//  BinarySearch
//
//  Created by sapere4ude on 2020/11/27.
//

import Foundation

// 이진 탐색 소스코드 (재귀함수)
func binarySearch(array: [Int], num: Int) -> Int? {
    var start = 0
    var end = array.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        let value = array[mid]
        
        if value == num {
            return mid
        } else if value > num  {    // 내가 찾는 숫자(num)보다 추측 값(value)이 더 큰 경우, 다음엔 더 작게 추측
            end = mid - 1
        } else {                    // num이 추측 값(value) 보다 더 큰 경우, 다음엔 더 크게 추측
            start = mid + 1
        }
    }
    return nil
}

// input[0] : 원소의 개수 , input[1]: 찾고자 하는 문자열
let input = readLine()!.components(separatedBy: " ").map { Int($0)!}

var array = readLine()!.components(separatedBy: " ").map { Int($0)!}

print(binarySearch(array: array, num: input[1]) ?? -1)  // swfit프로그래밍 p121 참고

