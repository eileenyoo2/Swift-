//
//  main.swift
//  Greedy-Q5
//
//  Created by sapere4ude on 2020/12/15.
//

import Foundation

// MARK: - [이것이 코딩테스트다. Q5]

// 해결방법 1.
let input = readLine()!.split(separator: " ").map { Int($0)! }
var N = input[0]    // 볼링공 갯수
var M = input[1]    // 공의 최대 무게

let bowlingBalls = readLine()!.split(separator: " ").map { Int($0)! }

var result = 0

// 해결방법 1.
// check = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
var check = Array(repeating: 0, count: 11)

// 볼링공의 무게에 따라 몇개가 존재하는지 체크해줌
for x in bowlingBalls {
    check[x] += 1
}

// 1부터 공의 최대무게(M)까지의 각 무게에 대하여 처리
for i in 1 ..< M+1 {
    N -= check[i]   // 무게가 i인 볼링공의 개수 제외. 즉, A가 선택할 수 있는 개수
    result += check[i] * N  // 같은 무게의 공이 몇개가 있는지 * B가 선택할 수 있는 볼링공 개수
}

print(result)


// 해결방법 2.
//for i in 0 ..< bowlingBalls.count - 1 {
//    for j in i+1 ..< bowlingBalls.count {
//        if bowlingBalls[i] == bowlingBalls[j] {
//            continue
//        }
//        else {
//            result += 1
//        }
//    }
//}
//
//print(result)
