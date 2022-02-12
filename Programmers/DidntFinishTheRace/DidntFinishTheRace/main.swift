//
//  main.swift
//  DidntFinishTheRace
//
//  Created by Kant on 2021/10/31.
//


// 프로그래머스 > 해시 > 완주하지 못한 선수

// 풀이 방법
// 정렬을 진행하고 인덱스별로 값이 다른것을 확인했을때 문제되는 점은 participate의 마지막 인덱스인 경우를 확인할 수 없다는 것이다.
// 그러므로 participate의 마지막 인덱스를 return 해주는 코드를 넣어줘야 한다.


import Foundation

func solution(participant: [String], completion: [String]) -> String{

    let p = participant.sorted()
    let c = completion.sorted()
    
    var result: String = ""
    
    for x in 0 ... c.count - 1 {
        print("x->\(x)")
        if (p[x] != c[x]) {
            result = p[x]
            return result
        }
    }

    print("result -> \(p[p.count - 1])")
    return p[p.count - 1];
}


solution(participant: ["marina", "josipa", "nikola", "vinko", "filipa"], completion: ["josipa", "filipa", "marina", "nikola"])
