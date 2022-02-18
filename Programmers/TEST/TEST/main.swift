//
//  main.swift
//  TEST
//
//  Created by Kant on 2022/02/17.
//

func solution(weight: [Float]) -> Int {
    // Write your code here
    
//    var weight = weight.sorted(by: >)
//    var test = [Float]()
//    var total = 0
//    print(weight)
//
//    var temp = weight
//
//    while temp.filter({$0 == 0}).count != weight.count {
//    for i in 0 ... weight.count-2 {
//        var w = temp[i]
//        if temp[i] == 0 {
//            w = temp[i+1]
//            test.append(w)
//            temp[i+1] = 0
//        } else {
//            test.append(w)
//            temp[i] = 0
//        }
//        print("w:\(w)")
//
//        for j in i+1 ... weight.count-1 {
//
//            if w + weight[j] <= Float(weight.count) {
//                test.removeLast()
//                test.append(w+weight[j])
//                temp[j] = 0
//                break
//            }
//        }
//        print(test)
//        }
//        print(test.count)
//        return test.count
//    }
//    return 0
    
    var weight = weight.sorted(by: >)
    var temp = weight
    var test = [Float]()
    
    var value = 0.0
    var w = 0.0
    
    
    while !temp.isEmpty{
        value = Double(Float(weight.count) - temp.removeFirst())
        
        print("temp:\(temp)")
        if temp.count > 0 {
            for i in 0 ... temp.count-1 {
                print("temp[i]:\(temp[i])")
                if Double(temp[i]) + w <= value {
                    //print("weight[i]:\(weight[i])")
                    w += Double(weight[i])
                } else {
                    test.append(Float(w))
                    w = 0
                    break
                }
            }
        }
        print(test)
    }
    return test.count
}

//solution(weight: [1.01, 1.99, 2.5, 1.5, 1.01])
solution(weight: [1.4, 1.01, 2.4, 1.01, 1.01])

