//
//  main.swift
//  BiggestNumber
//
//  Created by sapere4ude on 2021/01/03.
//

// [프로그래머스 가장 큰 수]

import Foundation

func solution(_ numbers:[Int]) -> String {
    
    let result = numbers.sorted { Int("\($0)\($1)")! > Int("\($1)\($0)")!}
    
    
    if result[0] == 0 {
        return "0"
    }
    return result.reduce(""){ $0 + "\($1)"}
}

print(solution([6,10,2]))


