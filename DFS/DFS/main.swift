//
//  main.swift
//  DFS
//
//  Created by sapere4ude on 2020/11/27.
//

/// DFS : 깊이 우선 탐색. 특정한 경로를 탐색하다가 특정한 상황에서 최대한 깊숙이 들어가서 노드를 방문한 후, 다시 돌아가 다른 경로로 탐색하는 알고리즘.
/// 탐색 방법 : 1. 탐색 시작 노드를 스택에 삽입하고 방문 처리를 한다. 2. 스택의 최상단 노드에 방문하지 않은 인접 노드가 있으면 그 인접 노드를 스택에 넣고 방문 처리를 한다. 방문하지 않은 인접 노드가 없으면 스택에서 최상단 노드를 꺼낸다. 3. 2번의 과정을 더 이상 수행할 수 없을 때까지 반복한다. (방문처리 : 스택에 한 번 삽입되어 처리된 노드가 다시 삽입되지 않게 체크하는 것을 의미. 방문 처리를 함으로써 각 노드를 한 번씩만 처리할 수 있다.)

import Foundation

var visited = Array(repeating: false, count: 9)

func dfs(_ graph: [[Int]], _ v: Int) {
    visited[v] = true
    print("\(v) visited: \(visited)")
    
    for i in graph[v] {
        if !visited[i] {
            dfs(graph, i)
        }
    }
}

var graph = [
    [],
    [2, 3, 8],
    [1, 7],
    [1, 4, 5],
    [3, 5],
    [3, 4],
    [7],
    [2, 6, 8],
    [1, 7]
]


dfs(graph, 1)
