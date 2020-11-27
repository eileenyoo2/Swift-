//
//  main.swift
//  BFS
//
//  Created by sapere4ude on 2020/11/27.
//


/// BFS : 너비 우선 탐색. 가까운 노드부터 탐색하는 알고리즘. BFS를 구현할 땐 선입선출 방식인 큐 자료구조를 이용하는 것이 수월하다. 인접한 노드를 반복적으로 큐에 넣도록 알고리즘을 작성하면 먼저 들어온 것이 먼저 나가게 된다.
/// 탐색 방법 : 1. 탐색 시작 노드를 큐에 삽입하고 방문 처리를 한다. 2. 큐에서 노드를 꺼내 해당 인접 노드 중에서 방문하지 않은 노드를 모두 큐에 삽입하고 방문 처리를 한다. 3. 2번의 과정을 더 이상 수행할 수 없을 때까지 반복한다.

import Foundation

var visited = Array(repeating: false, count: 9)
// [false, false, false, false, false, false, false, false, false]

func bfs(_ graph: [[Int]], _ start: Int) {
    var queue: [Int] = [start]
    visited[start] = true
    
    while !queue.isEmpty {
        let v = queue.removeFirst()
        print(v, terminator: " ")
    
        for i in graph[v] {
            if !visited[i] {
                queue.append(i)
                visited[i] = true
            }
        }
    }
}

let graph = [
    [1],
    [2,3,8],
    [1,7],
    [1,4,5],
    [3,5],
    [3,4],
    [7],
    [2,6,8],
    [1,7]
]

print(graph.count)

// DFS함수 호출
bfs(graph,1)
