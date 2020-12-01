//
//  main.swift
//  selectionSort
//
//  Created by sapere4ude on 2020/12/01.
//

// MARK: - 선택정렬
import Foundation

func selectionSort<T>(_ a: [T], _ compare:(T,T) -> Bool) -> [T] {

    var array = a

    for i in array.indices {    // indices : 배열을 안전하게 돌 수 있게 함
        var minIndex = i
        for j in i+1..<array.count {
            if compare(array[j], array[minIndex]) {     // array[j] < array[minIndex]
                minIndex = j
            }
        }
        let temp = array[i]
        array[i] = array[minIndex]
        array[minIndex] = temp
    }
    return array
}

var inputArray = readLine()!.components(separatedBy: " ").map( {Int($0)!})

print(selectionSort(inputArray, {$0 < $1}))
