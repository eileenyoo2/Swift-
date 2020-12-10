//
//  main.swift
//  Implement
//
//  Created by sapere4ude on 2020/12/10.
//

// [이것이 코딩테스트다 예제4-1]

import Foundation

let mapSize = Int(readLine()!)
let setPoints = readLine()!.split(separator: " ").map { String($0) }

var x = 1
var y = 1
var nx: Int = 1
var ny: Int = 1

// L, R, U, D 에 따른 이동 방향 (순서대로 서,동,북,남)
let dx = [0,0,-1,1]
let dy = [-1,1,0,0]
let moveType: [String] = ["L","R","U","D"]

// 이동계획 확인
for setPoint in setPoints {
    // 이동 후 좌표 구하기
    for i in 0..<moveType.count {
        if setPoint == moveType[i] {
            nx = x + dx[i]
            ny = y + dy[i]
        }
    }
    // 공간을 벗어나는 경우는 무시
    if nx < 1 || ny < 1 || nx > mapSize! || ny > mapSize! {
        continue
    }
    // 이동 수행
    x = nx
    y = ny
}

print(x, y)
