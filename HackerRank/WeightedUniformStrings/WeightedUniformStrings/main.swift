//
//  main.swift
//  WeightedUniformStrings
//
//  Created by Kant on 2022/02/13.
//

import Foundation

/*
 * Complete the 'weightedUniformStrings' function below.
 *
 * The function is expected to return a STRING_ARRAY.
 * The function accepts following parameters:
 *  1. STRING s
 *  2. INTEGER_ARRAY queries
 */

// 알파벳 -> 숫자로 전환시 배열의 인덱스를 이용하여 접근
// 배열 값의 인덱스를 알고 싶ㅇ다면 firstIndex(of:) 를 사용하여 접근할 것
// 카운팅해주는 변수를 선언할땐 이것이 언제 초기화가 필요한지를 생각할 것

func weightedUniformStrings(s: String, queries: [Int]) -> [String] {
    // Write your code here
    var weight = [String]()
    var alphabetArray = [String]()
    var temp = [Int]()
    var result = [String]()

    // a:0, b:1, c:2, d:3, e:4, ...
    for i in "abcdefghijklmnopqrstuvwxyz" {
        alphabetArray.append(String(i))
    }
    
    for (index, value) in s.enumerated() {
        weight.append(String(value))
        if index >= 1, weight[index-1].contains(String(value)){
            weight[index] = String(weight[index-1])+String(value)
        }
    }
    print(weight) // ["a", "b", "bb", "c", "cc", "ccc", "d", "dd", "ddd", "dddd"]
    
    for index in 0 ... weight.count-1 {
        var cnt = 0
        for x in weight[index] {
            cnt += alphabetArray.firstIndex(of: String(x))! + 1
        }
        temp.append(cnt)
        print(temp)
    }
    
    for i in queries {
        if temp.contains(i) {
            result.append("Yes")
        } else {
            result.append("No")
        }
    }
    print(result)
    return result
}

weightedUniformStrings(s: "abbcccdddd", queries: [1,7,5,4,15])

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!
//
//guard let s = readLine() else { fatalError("Bad input") }
//
//guard let queriesCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
//else { fatalError("Bad input") }
//
//var queries = [Int]()
//
//for _ in 1...queriesCount {
//    guard let queriesItem = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
//    else { fatalError("Bad input") }
//
//    queries.append(queriesItem)
//}
//
//guard queries.count == queriesCount else { fatalError("Bad input") }
//
//let result = weightedUniformStrings(s: s, queries: queries)
//
//fileHandle.write(result.joined(separator: "\n").data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
