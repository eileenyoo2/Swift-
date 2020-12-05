//
//  main.swift
//  Dijkstra
//
//  Created by sapere4ude on 2020/12/03.
//

import Foundation


// MARK: - 다익스트라 알고리즘

let INF = 123456789

let NodeAndEdge = readLine()!.split(separator: " ").map{ Int($0)! }

let n = NodeAndEdge[0]  // 노드의 개수
let m = NodeAndEdge[1]  // 간선의 개수

let start = Int(readLine()!)!   // 시작 노드

var graph: [[(destination: Int, cost: Int)]] = Array(repeating: [], count: n+1)    // 각 노드에 연결되어 있는 노드에 대한 정보를 담는 배열
var visited = Array(repeating: false, count: n+1)   // 방문 여부를 체크하는 배열
var distance = Array(repeating: INF, count: n+1)    // 최단거리 테이블을 무한으로 초기화

// 간선의 개수 입력받기
for _ in 0 ..< m {
    let informationOfEdge = readLine()!.split(separator: " ").map{ Int($0)! }
    let a = informationOfEdge[0]
    let b = informationOfEdge[1]
    let c = informationOfEdge[2]

    graph[a].append((b,c))    // a노드에서 b노드로 가는 비용이 c
}

func getSmallestNode() -> Int {
    var min_value = INF
    var index = 0
    for i in 1 ..< n+1 {
        if distance[i] < min_value, !visited[i] {
            min_value = distance[i]
            index = i
        }
    }
    return index
}

func dijkstra(_ start: Int) {

    // 시작 노드 초기화
    distance[start] = 0
    visited[start] = true

    for j in graph[start] {
        distance[j.destination] = j.cost
        print("\(distance[j.destination])")
        print("\(j.cost)")
        print("\n")
    }

    // 시작 노드를 제외한  전체 n-1개의 노드에 대해 반복
    for _ in 0 ..< n-1 {
        // 현재 최단 거리가 가장 짧은 노드를 꺼내고 방문처리
        let now = getSmallestNode()
        visited[now] = true
        // 현재 노드와 연결된 다른 노드를 확인
        for j in graph[now] {
            let cost = distance[now] + j.cost

            // 현재 노드를 거쳐서 다른 노드로 이동하는 거리가 더 짧은 경우
            if cost < distance[j.destination] {
                distance[j.destination] = cost
            }
        }
    }
}

// 다익스트라 알고리즘 수행
dijkstra(start)

// 모든 노드로 가기 위한 최단거리를 출력
for i in 1 ..< n+1 {
    // 도달할 수 없는 경우, 무한(INF)이라고 출력
    if distance[i] == INF {
        print("INF")
    }
    // 도달할 수 있는 경우
    else {
        print(distance[i])
    }
}


