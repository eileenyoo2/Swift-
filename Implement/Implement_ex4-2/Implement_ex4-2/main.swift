//
//  main.swift
//  Implement_ex4-2
//
//  Created by sapere4ude on 2020/12/10.
//

import Foundation

// [이것이 코딩테스트다 예제4-2]
// contains는 배열 또는 '문자열'에서 요소를 검색할 때 사용가능함.
// i,j,k를 합쳐 하나의 문자열로 만들어준 뒤 '3'이 포함되어 있는지를 찾는다

let h = Int(readLine()!)!  // n의 타입은 Optional<String> 그래서 형 변환 시켜주는 것
var count = 0

for i in 0 ..< h+1 {
    for j in 0 ..< 60 {
        for k in 0 ..< 60 {
            if ("\(i)" + "\(j)" + "\(k)").contains("3") {
                count += 1
            }
        }
    }
}
print(count)
