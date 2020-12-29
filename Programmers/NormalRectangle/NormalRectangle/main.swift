//
//  main.swift
//  NormalRectangle
//
//  Created by sapere4ude on 2020/12/29.
//

// [프로그래머스 멀쩡한 사각형]

/*
 문제의 핵심은 빗선이 지나가는 사각형의 개수 = 가로 + 세로 - (가로, 세로의 최대공약수)
 최대공약수를 구하는 풀이를 알아야 한다
 */
import Foundation

// 최대공약수 구하는 방법
func GCD(_ a: Int64, _ b: Int64) -> Int64 {
    let remain = a % b
    if remain == 0 {
        return b
    } else {
        return GCD(b, remain)
    }
}

func solution(_ w:Int, _ h:Int) -> Int64 {
    let w64 = Int64(w), h64 = Int64(h)
    return w64 * h64 - (w64 + h64 - GCD(w64, h64))
}
