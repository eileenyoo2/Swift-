//
//  main.swift
//  Implement-Q8
//
//  Created by sapere4ude on 2020/12/16.
//

// [이것이 코딩테스트다 Q8. 문자열 재정렬]
import Foundation

var ArrayForAlphabet:[String] = []
var sum: Int = 0

var input = readLine()!.uppercased().map { String($0)}
input.sort()

// String -> Int로 변환이 불가능할 경우엔 nil이 출력되는 것을 이용한다.
for i in 0 ..< input.count {
    if Int(input[i]) == nil {
        ArrayForAlphabet.append(input[i])
    }
    else {
        sum += Int(input[i])!
    }
}

// ArrayForAlphabet은 [String] 모양이므로 String 으로 변환시킨다.
print("\(ArrayForAlphabet.joined(separator: ""))" + "\(sum)")
