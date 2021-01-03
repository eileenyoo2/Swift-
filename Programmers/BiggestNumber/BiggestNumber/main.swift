//
//  main.swift
//  BiggestNumber
//
//  Created by sapere4ude on 2021/01/03.
//

// [프로그래머스 가장 큰 수]

import Foundation

func solution(_ numbers:[Int]) -> String {
    
    var strings = numbers.map{String($0)}
    strings.sort{ $0+$1 > $1+$0 }
    
    let answer = strings.joined()
    print(answer)
    if let num = Int(answer) { return String(num) }
    return answer
}

print(solution([0,0,0]))


