//
//  main.swift
//  BracketChange
//
//  Created by sapere4ude on 2020/12/22.
//

// [이것이코딩테스트다 Q18. 괄호변환]

import Foundation

// 균형잡힌 괄호 문자열 -> 올바른 괄호 문자열 변환
func solution(_ p:String) -> String {
    
    func isCorrect(_ s: String) -> Bool {
        var count: Int = 0
        
        for char in s {
            switch char {
            case "(":
                count += 1
            case ")":
                count -= 1
            default:
                break
            }
            
            if count < 0 {
                break
            }
        }
        return count == 0
    }
    
    func conversion(_ w: String) -> String {
        if w == "" { return "" }    // 1. 입력이 빈 문자열인 경우, 빈 문자열을 반환
        
        var result: String = "", u: String = ""
        var count: Int = 0
        
        // String 으로 받은 w 문자열을 count로 계산해줄 수 있다
        for i in 0 ..< w.count {
            let str: String = String(w[w.index(w.startIndex, offsetBy: i)])
            // 수행한 결과 문자열을 u에 이어 붙인 후 반환
            u += str
            // u 가 '올바른 괄호 문자열' 인지 체크하는 과정
            switch str {
            case "(":
                count += 1
            case ")":
                count -= 1
            default:
                break
            }
            
            if count == 0 {
                let idx: String.Index = w.index(w.startIndex, offsetBy: i+1)
                let v: String = String(w[idx ..< w.endIndex])
                // 문자열 u가 "올바른 괄호 문자열" 이라면 문자열 v에 대해 1단계부터 다시 수행
                if isCorrect(u) {
                    result += u
                    result += conversion(v)
                }
                // 문자열 u가 "올바른 괄호 문자열"이 아니라면 아래 과정을 수행
                else {
                    u = String(u[u.index(u.startIndex, offsetBy: 1) ..< u.endIndex]) // 빈 문자열
                    u = String(u[u.startIndex ..< u.index(u.startIndex, offsetBy: u.count - 1)])
                    u = u.replacingOccurrences(of: "(", with: "#")  // ( -> # 으로 치환
                        .replacingOccurrences(of: ")", with: "(")   // ) -> ( 으로 치환
                        .replacingOccurrences(of: "#", with: ")")   // # -> ) 으로 치환
                    result += "(" + conversion(v) + ")" + u
                }
                break
            }
        }
        return result
    }
    
    return conversion(p)
}
