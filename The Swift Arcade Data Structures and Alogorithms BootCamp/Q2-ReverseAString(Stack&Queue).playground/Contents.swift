import UIKit

// https://www.fullstack.cafe/interview-questions/stacks

/*
 Giving a String, write a function that reserves the String
 using a stack.
 */

func solution(_ text: String) -> String {
    
    // Case1. 내 풀이
//    var array = [Character]()
//
//    for i in text {
//        array.append(i)
//    }
//    var result: String = ""
//
//    while !array.isEmpty {
//        result += String(array.removeLast())
//    }
//    return result
    
    // Case2. 선생님 풀이
    var chars = Array(text)
    var result = [String]()
    
    for c in chars {
        result.append(String(c))
    }
    
    for i in 0 ..< result.count {
        chars[i] = Character(result.popLast()!)
    }
    return String(chars)
    
    
}

solution("abc") // cba
solution("Would you like to play a game?")
