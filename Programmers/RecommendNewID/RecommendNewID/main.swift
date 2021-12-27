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
    
    var new_id = new_id
    // case1
    new_id.lowercased()
    // case2
    new_id.replacingOccurrences(of: "-", with: "")
          .replacingOccurrences(of: "_", with: "")
          .replacingOccurrences(of: ".", with: "")
    
    
    return ""
}

solution("ADVssa")
