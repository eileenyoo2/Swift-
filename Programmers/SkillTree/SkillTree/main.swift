//
//  main.swift
//  SkillTree
//
//  Created by sapere4ude on 2021/01/01.
//

// [프로그래머스 스킬트리]

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    
    var result = 0
    
    for i in skill_trees{
        print("i:\(i)")
        var currentSkill = ""
        
        for j in i {
            print("j:\(j), i:\(i)")
            if skill.contains(j) {
                currentSkill += String(j)
                print(currentSkill)
            }
        }
        // hasPrefix : 문자열이 어떤 글자로 시작하는지 확인
        if skill.hasPrefix(currentSkill) {
            print("currentSkill:\(currentSkill)")
            result += 1
        }
        print("--------------------------")
    }
    print(result)
    return result
}

solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"])


