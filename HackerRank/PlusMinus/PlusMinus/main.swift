//
//  main.swift
//  PlusMinus
//
//  Created by Kant on 2022/02/12.
//

import Foundation

/*
 * Complete the 'plusMinus' function below.
 *
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

func plusMinus(arr: [Int]) -> Void {
    // Write your code here
    var positive = 0
    var negative = 0
    var zero = 0
    for i in 0 ... arr.count-1 {
        if arr[i] > 0 {
            positive = positive + 1
        } else if arr[i] < 0 {
            negative = negative + 1
        } else {
            zero = zero + 1
        }
    }
    print(String(format: "%.5f", Double(positive)/Double(arr.count)) + "\n" + String(format: "%.5f", Double(negative)/Double(arr.count)) + "\n" + String(format: "%.5f", Double(zero)/Double(arr.count)))
    
}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

plusMinus(arr: arr)
