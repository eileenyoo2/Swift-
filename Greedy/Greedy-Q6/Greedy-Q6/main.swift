//
//  main.swift
//  Greedy-Q6
//
//  Created by sapere4ude on 2020/12/16.
//

import Foundation

// MARK: - [이것이 코딩테스트다. Q6]

func solution(_ food_times:[Int], _ K:Int64) -> Int {
    // 모든 음식을 방송이 중단되기 전에 다 먹을 수 있는 경우
    guard food_times.reduce(0, +) > K else {
        return -1
    }
    // 64비트 머신에서 Int와 Int64는 동일한 값이다
    var k: Int = Int(K)

    // 시간과 인덱스를 저장한 배열을 작성
    var food_info: [(time: Int, idx: Int)] = food_times.enumerated().map { ($1,$0) }
        .sorted(by: <)
    print(food_info)

    var i = 0, j = 0, cycle = 0
    
    // 일괄적으로 먹어치울 수 있는 부분을 처리
    while i < food_info.count {
        j = i
        
        // 먹는 시간이 같은 음식의 총 갯수를 j로 확인
        while j < food_info.count
            && food_info[i].time == food_info[j].time { j += 1 }
        
        let eats = food_info[i].time - cycle
        let dec = (food_info.count - i) * eats
        // 다음 음식을 먹는데 필요한 총 시간보다 남은 시간이 짧으면 루프 탈출
        if dec > k { break }
        
        // 먹는데 소요된 시간을 k에서 빼 준다
        k -= dec
        cycle += eats
        // 다음 탐색할 인덱스를 다 먹은 음식 다음걸로 옮김
        i = j
    }
    
    // 루프를 돌리고도 못 먹은 음식들의 인덱스를 오름차순 정렬
    food_info = food_info[i...].sorted { $0.idx < $1.idx }
    // 남은 시간을 루프로 돌릴 수 있을 만큼 전부 소모하고 난 후의 값이 음식 인덱스
    k = k % food_info.count
    
    // 배열 인덱스에 +1 한 값이 방송 재개후 먹을 음식이 됨
    return food_info[k].idx + 1
}

print(solution([3,1,2], 5))
