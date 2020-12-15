//
//  main.swift
//  Greedy-Q4
//
//  Created by sapere4ude on 2020/12/15.
//

// [이것이 코딩테스트다. 그리디 Q04]
// 최솟값을 구해야함. 그렇기때문에 오름차순으로 정렬한 뒤, 누적합을 구헤야 한다.
// 누적헙과 화폐 단위를 비교한다. '화폐 단위 > 누적합'일 경우 두 숫자 사이에 갭이 있다는 뜻. 중간에 만들지 못하는 금액이 생김.
// 이 때 누적합이 최솟값이 됨.

// 문제 이해 안됨. 첫번째로 coin의 개수를 받아두고 사용하는 곳이 없음. 그리디라는 것이 완벽하게 이해된 것 같지 않음...

import Foundation

let coin = Int(readLine()!)!
var target = 1

// split이 있으면 Int로 맵핑이 가능해진다
var values = readLine()!.split(separator: " ").map { Int($0)! }

values.sort()

for i in values {
    if target < i {
        break
    }
    target += i
}

print(target)
