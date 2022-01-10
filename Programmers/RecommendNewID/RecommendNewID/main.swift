//
//  main.swift
//  RecommendNewID
//
//  Created by Kant on 2021/12/19.
//

// 프로그래머스 > 2021 카카오 블라인드 채용 > 신규 아이디 추천

// 아이디 길이 3 <= ㅁ <= 15
// 아이디에 적을 수 있는 것 : 알파벳 소문자, 숫자, 빼기, 밑줄, 마침표
// 마침표는 처음과 끝에 사용할 수 없음, 연속으로 사용할 수 없음


import Foundation

func solution(_ new_id:String) -> String {
    
    var checkId = ""
    // case1
    let arrayId = new_id.lowercased()
    // case2
    let whiteList = ["-","_","."]
    
    for char in arrayId {
        if char.isLetter || char.isNumber || whiteList.contains(String(char)){
            checkId += String(char)
        }
    }
    
    while checkId.contains("..") {
        checkId = checkId.replacingOccurrences(of: "..", with: ".")
    }
    
    // case4
    if checkId[checkId.startIndex] == "." {
        checkId.remove(at: checkId.startIndex)
    }
    
    if checkId != "" {
        if checkId[checkId.index(before: checkId.endIndex)] == "." {
            checkId.removeLast()
        }
    }
    
    // case5
    if checkId == "" {
        checkId.append("a")
    }
    
    // case6
    if checkId.count >= 16 {
        let last = checkId.index(checkId.startIndex, offsetBy: 15)
        let range = last ..< checkId.endIndex
        checkId.removeSubrange(range)
    }
    
    if checkId != "" {
        if checkId[checkId.index(before: checkId.endIndex)] == "." {
            checkId.removeLast()
        }
    }
    
    // case7
    if checkId.count <= 2 {
        if checkId != "" {
            let end = checkId[checkId.index(before: checkId.endIndex)]
            while checkId.count < 3 {
                checkId.append(end)
            }
        }
    }
    
    
    print(checkId)
    return checkId
}

solution("...!@BaT#*..y.abcdefghijklm")
//solution("z-+.^.")
//solution("=.=")
//solution("abcdefghijklmn.p")

