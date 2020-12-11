//
//  main.swift
//  Implement_p155
//
//  Created by sapere4ude on 2020/12/11.
//

// [이것이 코딩테스트다 실전4-2]

import Foundation

// readLine() 이후에 split을 적어주지 않고 map을 사용하여 a1 을 a,1로 분리한다
var inputData = readLine()!.map { String($0) }
// 결과값 받기
var result = 0
// 행 위치 : 1~8, 열 위치 : a~h. 열의 위치를 알파벳이 아닌 숫자로 받기 위한 작업
let board = ["a":1, "b":2, "c":3, "d":4, "e":5, "f":6, "g":7, "h":8]    // Dictionary<String, Int>

// 이동할 수 있는 경우의 수
let steps: [(x: Int, y: Int)] = [(-2, -1), (-1, -2), (1, -2), (2, -1), (2, 1), (1, 2), (-1, 2), (-2, 1)]

// a1 은 1,1에 대입된다.
let inputXY = [board[inputData[0]]!, Int(inputData[1])!]

for step in steps {
    let nextX = inputXY[0] + step.x
    let nextY = inputXY[1] + step.y
    
    if nextX < 1 || nextX > 8 || nextY < 1 || nextY > 8 {
        continue
    } else {
        result += 1 // 이동가능하므로 +1
    }
}
print(result)


