//
//  main.swift
//  KthNumber
//
//  Created by sapere4ude on 2021/01/02.
//

// [프로그래머스 k번째 수]

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result : Array<Int> = []
    
    for i in 0..<commands.count{
        var temp : Array<Int> = []
        
        for j in commands[i][0]..<commands[i][1]+1{
            temp.append(array[j-1])
        }
        
        // sort vs sorted
        temp.sort()
        result.append(temp[commands[i][2]-1])
    }
    
    return result
}


solution([1,5,2,6,3,7,4], [[2,5,3],[4,4,1],[1,7,3]])

