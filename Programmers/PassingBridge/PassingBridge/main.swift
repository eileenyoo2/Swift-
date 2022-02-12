//
//  main.swift
//  PassingBridge
//
//  Created by sapere4ude on 2021/01/04.
//

// [프로그래머스 다리를 지나는 트럭]

// 빈 Array를 만들어주면서 개수를 체크해주는 것이 포인트

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var trucks = truck_weights
    var bridge = Array(repeating: 0, count: bridge_length)
    var sec = 0
    var w = 0
    
    while !bridge.isEmpty {
        // 1초마다 다리위의 트럭 또는 빈공간은 움직임
        w -= bridge.removeFirst() // w는 음수가 나와도 괜찮다. 왜냐면 아래에서 t+w 라는 계산을 하게 되니깐
        sec += 1
        
        // 다리에 진입 예정인 트럭을 포함한 무게와 다리가 견딜 수 있는 무게를 비교해서
        // 견딜 수 있으면 트럭 진입 시킨다.
        if let t = trucks.first {
            if t + w <= weight {
                w += trucks.removeFirst() // 트럭 진입
                bridge.append(t)          // 트럭 진입 완료
            } else {
                // 견딜 수 없으면 트럭 대기하고 빈공간만 보낸다.
                bridge.append(0)
            }
        }
    }
    return sec
}

print(solution(2, 10, [7,4,5,6]))


