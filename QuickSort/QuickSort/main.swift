//
//  main.swift
//  QuickSort
//
//  Created by sapere4ude on 2020/12/01.
//

// MARK: - QuickSort

import Foundation

// Quick Sort : 특정 원소를 한가지 지정하여 그것을 기준으로 작은값과 큰값을 나누어 분류해주는 것

func QuickSort(array: [Int]) -> [Int] {
    
    guard array.count > 1 else {    // 만약 배열의 원소가 하나라면 return
        return array
    }

    let pivot = array[0]

    let less = array.filter { $0 < pivot }
    let greater = array.filter { $0 > pivot }

    return QuickSort(array: less) + [pivot] + QuickSort(array: greater) // 배열끼리 더해줄 수 있음. 정수를 []를 사용하여 배열로 변경해줄 수 있다.

}

let insertArray = readLine()!.components(separatedBy: " ").map { Int($0)! }

print(QuickSort(array: insertArray))
