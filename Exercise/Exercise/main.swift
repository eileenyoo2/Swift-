//
//  main.swift
//  Exercise
//
//  Created by sapere4ude on 2020/11/26.
//

import Foundation

// 키보드로 입력받기
//var a = readLine()
//
//if let result = a {
//    var array = result.components(separatedBy: " ") // 공백을 기준으로 한칸 띄고 입력된다
//
//    for i in 0..<array.count{
//        print(array[i])
//    }
//}
//
//
///// 키보드로 입력받은 값을 공백으로 구분하는 2가지 방법
///// 1. return값이 String.SubSequence
//let input_data_ex1 = readLine()!.split(separator: " ")
///// 2. return 값이 String
//let input_data_ex2 = readLine()!.components(separatedBy: " ")
//print(input_data_ex1)
//print(input_data_ex2)
//
//input_data_ex1.map{print($0)}


/// 배열 다루기
/// 빈 배열 만들기
//var array_type1: [Int] = []
//print(type(of: array_type1))
//var array_type2: Array<Int> = [1,2,3,4,5]
//print(type(of: array_type2))
//
//let matrix = [[Int]]()
//let matrix_v2 = [[Int]](repeating: [], count: 3)    // [[], [], []]
//array_type2.reverse()
//print(array_type2.sorted())
//print(array_type2.sorted(by: >))

/// map
//var string = ["1","2","3","4"]
//print(string.map{ Int($0)! })   // [1,2,3,4] 각 원소를 전부 Int로 맵핑해준다.
//
///// filter
//var array = [1,3,5,7,9]
//print(array.filter { $0 % 3 == 0 }) // [3,9] 조건에 맞는 수만 뽑아낸다.
//
///// reduce
//var reduce_array = [1,2,3,4]
//print(reduce_array.reduce(0, +))    // 10 숫자의 합이 나온다. 문자열 합치기도 가능하다.
//// 규칙 적용 과정
//reduce_array.reduce(0,{(s1: Int, s2: Int) -> Int in
//    return s1 + s2
//})
//
//reduce_array.reduce(0){(s1: Int, s2: Int) -> Int in
//    return s1 + s2
//}
//
//array.reduce(0){(s1, s2) in s1 + s2}
//
//array.reduce(0){ $0 + $1 }
//
//array.reduce(0, +) // 초기항목은 {0 + 1}이고 값이 1이라면 {1 + 1} 이다.
//// 클로저는 이전 결과와 다음 항목을 계속 호출하여 다음과 같은 과정을 거쳐
//// 하나의 값을 얻는다. {0+1},{1+2},{3+3},{6+4} 이며, 결과는 10

/// 문자열 쪼개기
// 1. startIndex: 첫번째 문자의 인덱스, endIndex: 마지막 문자 다음의 인덱스
var str = "Hello, Swift"

let first = str[str.startIndex] // H
let last = str[str.endIndex]    // error: After last character

let range = str.startIndex..<str.endIndex
print(str[range]) // Hello, Swift

// 2. before: 입력된 인덱스의 바로 이전 인덱스
// 문법 표현 : index(before: String.Index)
var str = "Hello, Swift"
let index = str.index(before: str.endIndex)
print(str[index]) // t

// 3. after: 입력된 인덱스의 바로 다음 인덱스
// 문법 표현 : index(after: String.Index)
var str = "Hello Swift"
let index = str.index(after: str.startIndex)
print(str[index])   // e

// 4. offsetBy : 입력된 인덱스와의 거리값
// 문법 표현 : index(String.Index, offsetBy: String.IndexDistance)
var str = "Hello, Swift"
let index = str.index(str.startIndex, offsetBy: 7)
print(str[index]) // S

// 5. limitedBy : 인덱스의 한계치를 정해주는 메서드. offset이 이 값을 벗어날 경우 nil을 리턴
// 문법 표현 : index(String.Index, offsetBy : String.IndexDistance, limitedBy: String.Index)
var str = "Hello, Swift"
// 만약 offset이 10 이라면 if문을 skip한다.
if let index = str.index(str.startIndex, offsetBy: 7, limitedBy: str.endIndex) {
    print(str[index])   // S
}

// 6. substring(to: String.Index) : 처음부터 to 인덱스까지 가져오기
var str = "Hello, Swift"
let index = str.index(str.startIndex, offsetBy: 5)
print(str.substring(to: index)) // Hello

// 7. substring(from: String.Index) : from 인덱스부터 끝까지 가져오기
var str = "Hello, Swift"
let index = str.index(str.startIndex, offsetBy: 7)
print(str.substring(from: index))   // Swift

// 8. substring(with: Range) : 설정한 구간의 값 가져오기
var str = "Hello Swift"
let start = str.index(str.startIndex, offsetBy: 7)
let end = str.index(str.endIndex, offsetBy: -6)

let range = start..<end
print(str.substring(with: range)) // Swif
