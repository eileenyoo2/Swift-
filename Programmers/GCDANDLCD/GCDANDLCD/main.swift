//
//  main.swift
//  GCDANDLCD
//
//  Created by Kant on 2022/02/16.
//

import Foundation

func solution(_ n:Int, _ m:Int) -> [Int] {
    let gcd = gcd(n: n, m: m)
    let lcd = (n * m) / gcd
    
    var result = [Int]()
    result.append(gcd)
    result.append(lcd)
    
    print(result)
    return result
}

func gcd(n: Int, m: Int) -> Int {
    if m == 0 {
        return n
    } else {
        return gcd(n: m, m: n % m)
    }
}

solution(3, 12)
solution(2, 5)
