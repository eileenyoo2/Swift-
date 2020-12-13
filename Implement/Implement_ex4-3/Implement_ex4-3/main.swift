//
//  main.swift
//  Implement_ex4-3
//
//  Created by sapere4ude on 2020/12/13.
//

// [이것이 코딩테스트다 실전 4-3]

import Foundation

// 맵 크기
let mapSize = readLine()!.split(separator: " ").map( {Int($0)!} )

// (x,y) , 방향(동,서,남,북) 설정
var characterPosition = readLine()!.split(separator: " ").map( {Int($0)!} )

/* 방문한 위치를 저장하기 위한 맵을 생성하여 0으로 초기화
   d = [[0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]]
*/
var d: [[Int]] = Array(repeating: Array(repeating: 0, count: mapSize[0]), count: mapSize[1])

// 현재 좌표를 방문처리
d[characterPosition[0]][characterPosition[1]] = 1

// 전체 맵 정보 입력받기
var mapSetting:[[Int]]
for _ in 0 ..< mapSize[0] {
    mapSetting = readLine()!.split(separator: " ").map { Array(Int($0)!) }
}

// 방향 : 북 / 동 / 남 / 서
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

// 왼쪽으로 회전
var direction:Int = characterPosition[2]
func turnLeft() -> Int {
    // 반시계 방향으로 90도 회전
    direction -= 1
    if direction == -1 {
        direction = 3
    }
    return direction
}

// 시뮬레이션 시작
var count = 1
var turnTime = 0

while true {
    turnLeft()
    var nx = characterPosition[0] + dx[direction]
    var ny = characterPosition[1] + dy[direction]
    
    // 회전한 이후 정면에 가보지 않은 칸이 존재할 경우 -> 이동
    if d[nx][ny] == 0 && mapSetting[nx][ny] == 0 {
        d[nx][ny] = 1
        characterPosition[0] = nx
        characterPosition[1] = ny
        count += 1
        turnTime = 0
        continue
    }
    // 회전한 이후 정면에 가보지 않은 칸이 없거나 바다인 경우
    else {
        turnTime += 1
        // 네 방향 모두 갈 수 없는 경우
        if turnTime == 4 {
            nx = characterPosition[0] - dx[direction]
            ny = characterPosition[1] - dy[direction]
            // 뒤로 갈 수 있다면 이동
            if mapSetting[nx][ny] == 0 {
                characterPosition[0] = nx
                characterPosition[1] = ny
            }
            // 뒤가 바다로 막혀있는 경우
            else {
                break
            }
            turnTime = 0
        }
    }
}

print(count)
