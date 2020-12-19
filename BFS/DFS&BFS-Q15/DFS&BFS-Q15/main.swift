//
//  main.swift
//  DFS&BFS-Q15
//
//  Created by sapere4ude on 2020/12/17.
//

// [이것이 코딩테스트다 Q15. 특정 거리의 도시 찾기]

import Foundation

// N: 도시개수, M: 도로의 개수, X: 거리정보, K: 출발 도시의 번호
let NMKX = readLine()!.split(separator: " ").map{ Int(String($0))! }
var graph: [[Int]] = Array(repeating: [], count: NMKX[0]+1)
var visited: [Int] = Array(repeating: -1, count: NMKX[0]+1)

// 이 부분이 이해가 잘 안됨
for _ in 0 ..< NMKX[1] {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph[input[0]].append(input[1])
}

let start = NMKX[3]
let distance = NMKX[2]
var queue: [Int] = []
queue.append(start)
visited[start] = 0

var curIdx = 0
while curIdx < queue.count {
    let cur = queue[curIdx]
    curIdx += 1
    for next in graph[cur] {
        if visited[next] == -1 {
            queue.append(next);
            visited[next] = visited[cur] + 1
        }
    }
}

var checked = false
for i in visited.indices {
    if visited[i] == NMKX[2] {
        print(i)
        checked = true
    }
}
if !checked {
    print(-1)
}
