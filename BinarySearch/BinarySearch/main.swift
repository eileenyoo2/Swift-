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
    
    while start < end {
        let mid = (start + end) / 2
        
    }
    return array
}

let input = readLine()!.components(separatedBy: " ")  // n(원소의 개수), target(찾고자 하는 문자열) 입력받기
let inputChangeInt = input.map( {Int($0)!})    // 강제형변환 사용

var array = readLine()!.components(separatedBy: " ")
var arrayChangeInt = array.map({Int($0)!})
//print(str)
//print(type(of: strChange[0]))
