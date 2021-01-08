//
//  main.swift
//  MakeLargeNumber
//
//  Created by sapere4ude on 2021/01/07.
//

// [프로그래머스 큰 수 만들기]

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    
    let map = number.map { String($0)}  // map 자체가 배열을 만들어준다
    print("map--->\(map)")
    var stack = [String]()  // number를 받기 위한 배열
    var count = 0           // 삭제한 수
    
    for i in 0 ..< number.count {
        while count < k && !stack.isEmpty && stack.last! < map[i] {
            stack.removeLast()
            count += 1
        }
        
        if count >= k {
            stack.append(contentsOf: map[i...]) // map[i] 의 i번째 인덱스 이상의 값들 전부
            print("stack, k를 넘은 경우 --->\(stack)")
            break
        } else {
            stack.append(map[i])
            print("stack, k를 넘지 못한 경우 --->\(stack)")
        }
    }
    print(String(stack.joined().prefix(number.count - k)))
    return String(stack.joined().prefix(number.count - k))
}

solution("1924", 2)
