//
//  main.swift
//  NumStringAndWord
//
//  Created by Kant on 2021/12/19.
//

import Foundation

func solution(_ s:String) -> Int {
    
    var stringToNum = ""
    var result = ""
    
    for c in s {
        if c.isNumber {
            result += String(c)
        } else {
            stringToNum += String(c)
            if check(stringToNum) != -1 {
                result += String(check(stringToNum))
                stringToNum = ""
            }
        }
    }
    return Int(result)!
}

func check(_ s:String) -> Int {
    switch s {
    case "zero":
        return 0
    case "one":
        return 1
    case "two":
        return 2
    case "three":
        return 3
    case "four":
        return 4
    case "five":
        return 5
    case "six":
        return 6
    case "seven":
        return 7
    case "eight":
        return 8
    case "nine":
        return 9
    default:
        return -1
    }
}

print(solution("one4seveneight"))
//print(solution("23four5six7"))
//print(solution("2three45sixseven"))
//print(solution("123"))
