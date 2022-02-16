//
//  main.swift
//  TwoCharacters
//
//  Created by Kant on 2022/02/15.
//

import Foundation
import Algorithms

// 주어진 문자열에서 2가지를 제거해야함
// 제거했을때 가장 길이가 길 수 있는 경우를 골라야함.
// 이 문자열은 중복된 문자가 연속되면 안됨.

func alternate(s: String) -> Int {
    // Write your code here
    var temp = [String]()
    var savedCharacters = [String]()
    var combinationArray = [[String]]()
    var result = [String]()
    var end = [Int]()
    
    for i in s {
        temp.append(String(i))
        if !savedCharacters.contains(String(i)) {
            savedCharacters.append(String(i))
        }
    }
    savedCharacters.sort()
    print(savedCharacters)
    
    for combo in savedCharacters.combinations(ofCount: 2){
        combinationArray.append(combo)
    }
    print(combinationArray)
    
    for i in 0 ... combinationArray.count-1 {
        var test = temp
        for j in 0 ... combinationArray[i].count-1 {
            if temp.contains(combinationArray[i][j]) {
                var index = 0
                index = temp.firstIndex(of: combinationArray[i][j])!
//                print("index:\(index)")
                print("temp[index]:\(temp[index])")

                for i in test {
                    if i == temp[index] {
                        test.remove(at: test.firstIndex(of: i)!)
                    }
                }
            }
        }
        // 연속 중복되면 탈락시켜야함
        print("test:\(test)")
        
        for i in 0 ... test.count-1 {
            result.append(test[i])
            if i > 0, test[i-1] == test[i] {
                result.removeAll()
                break
            }
            print("result:\(result.count)")
            end.append(result.count)
        }
    }
    end.sort(by: >)
    print(end[0])
    return end[0]
}

alternate(s: "beabeefeab")
