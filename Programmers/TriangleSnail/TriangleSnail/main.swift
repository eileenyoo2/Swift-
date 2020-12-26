//
//  main.swift
//  TriangleSnail
//
//  Created by sapere4ude on 2020/12/23.
//

// [프로그래머스. 삼각달팽이]

import Foundation
/*
dx[0], dy[0] : 좌하단 방향으로 달팽이 채우기
dx[1], dy[1] : 우 방향으로 달팽이 채우기
dx[2], dy[2] : 좌상단 방향으로 달팽이 채우기
 */
let dx = [1, 0, -1]
let dy = [0, 1, -1]

func solution(_ n:Int) -> [Int] {

    var direction = 0       // 앞서 정의했던 dx, dy의 인덱스 역할
    var row = 0, col = 0    // 달팽이 채우기를 할때의 그리는 위치를 확인하기 위한 행, 열을 담당
    var num = 1             // 1,2,3,4,5,6 식으로 달팽이 채우기를 할때, 넘버링할 숫자
    var graph = [[Int]]()   // 삼각형 모양을 만들어주는 코드

    (1 ... n).forEach {
        graph.append([Int](repeating: 0, count: $0))
    }

    // n, n-1, n-2, ... 1 : 전환점까지의 거리
    (1 ... n).reversed().forEach {
        // 달팽이 채우기 방향에 맞게 숫자를 채우는 과정. 좌하단 방향으로 채우는 코드
        (0 ..< $0 - 1).forEach { _ in
            graph[row][col] = num
            row += dx[direction]
            col += dy[direction]
            num += 1
        }

        graph[row][col] = num
        num += 1
        direction = (direction + 1) % 3 // 방향전환
        row += dx[direction]
        col += dy[direction]
    }

    return graph.reduce(into: [Int]()) { $0.append(contentsOf: $1) }
}

//let graph = [[1,2,3],[4,5,6]]
//
//print(graph.reduce(into: [Int]()) { $0.append(contentsOf: $1) })





