//
//  main.swift
//  KthNumber
//
//  Created by sapere4ude on 2021/01/02.
//

// [프로그래머스 k번째 수]

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var result = [Int]()
    var temp = [[Int]]()
    var final = [Int]()

    for i in 0 ... commands.count-1 {
        var start = commands[i][0] - 1
        var end = commands[i][1] - 1
        result = Array(array[start...end])
     
        result.sort(by: <)
        temp.append(result)
    }
    
    for i in 0 ... commands.count-1 {
        var idx = commands[i][2] - 1
        final.append(temp[i][idx])
    }
    print(final)
    return final
}


solution([1,5,2,6,3,7,4], [[2,5,3],[4,4,1],[1,7,3]])

