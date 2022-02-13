//
//  main.swift
//  BiggestNumber
//
//  Created by sapere4ude on 2021/01/03.
//

// [프로그래머스 가장 큰 수]

import Foundation

func solution(_ numbers:[Int]) -> String {
    var strings = numbers.map{String($0)}   // 정수를 문자열로 변경
    strings.sort{ $0+$1 > $1+$0 }           // 문자열을 합쳐서 값을 비교 (이 부분이 핵심)
    print("strings->\(strings)")
    let answer = strings.joined()           // 배열의 여러값을 하나의 문자열로 변경
    
    if let num = Int(answer) {              // 해당 라인을 통해 000 -> 0 으로 만들어줄 수 있다.
        return String(num)
    }
    return answer
}

print(solution([0,0,0]))
print(solution([3, 30, 34, 5, 9]))
