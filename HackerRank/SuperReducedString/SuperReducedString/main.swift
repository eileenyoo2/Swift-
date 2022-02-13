//
//  main.swift
//  SuperReducedString
//
//  Created by Kant on 2022/02/13.
//

import Foundation

func superReducedString(s: String) -> String {
    // Write your code here
    // 같은 문자가 2번 반복된다면 이를 제거. stack 을 사용하여 구현
    // for 문 돌릴때 c를 캐릭터형으로 인지함으로 이걸 String 으로 변환하여 사용해줘야한다.
    // 스택이 비었을 경우또한 생각해서 조건을 만들어야 한다.
    var stack = [String]()
    
    for c in s {
        print("c: \(c)")
        if stack.isEmpty == true || stack[stack.index(before: stack.endIndex)] != String(c) {
            stack.append(String(c))
        } else if stack[stack.index(before: stack.endIndex)] == String(c) {
            stack.removeLast()
        }
        print("stack:\(stack)")
    }
    
    if stack.isEmpty {
        return "Empty String"
    } else {
        return stack.joined(separator: "")
    }
}


print(superReducedString(s: "aaabccddd"))
