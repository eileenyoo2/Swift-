//
//  main.swift
//  ReverseTernaryScale
//
//  Created by sapere4ude on 2020/12/28.
//

// [프로그래머스 3진법 뒤집기]

import Foundation

func solution(_ n:Int) -> Int {
    
    let flipToThree = String(n,radix: 3)
    let answer = Int(String(flipToThree.reversed()),radix:3)!
    return answer
}


