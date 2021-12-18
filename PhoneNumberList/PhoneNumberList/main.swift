//
//  main.swift
//  PhoneNumberList
//
//  Created by Kant on 2021/12/07.
//

import Foundation

// 프로그래머스 > 해시 > 전화번호 목록
// key,value를 선언해주고 문제 접근하는 것이 포인트
// 비교 조건에서 일치하는 문자열을 찾을땐 hasPrefix 사용
// 자기 자신을 제외해야하는 것을 확인

func solution(phone_book: [String]) -> Bool {
    
    var dic = [String: Int]()
    var temp: String = ""
    
    for (key,value) in phone_book.enumerated() {
        dic.updateValue(1, forKey: value)
    }
    
    for y in phone_book {
        temp += y
        for (key, value) in phone_book.enumerated() {
            if value.hasPrefix(temp) && temp != value {
                print("temp :\(temp)")
                return false
            }
        }
    }
    return true
}

//print(solution(phone_book: ["119", "97674223", "1195524421"]))
//print(solution(phone_book: ["123", "456", "789"]))
print(solution(phone_book: ["12", "123", "1235", "567", "88"]))

