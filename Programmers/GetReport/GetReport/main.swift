//
//  main.swift
//  GetReport
//
//  Created by Kant on 2022/01/15.
//

// 프로그래머스 > 2022 카카오 > 신고 결과 받기

// 이용자의 ID가 담긴 문자열 배열 : id_list
// 각 이용자가 신고한 이용자의 ID 정보가 담긴 문자열 배열 : report
// 정지 기준이 되는 신고 횟수 : K
// 처리 결과 메일을 받은 횟수를 배열에 담아 return

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {

//    var reportID = [[""],[""],[""],[""]]
    var reportID = Array(repeating: [""], count: id_list.count)
    var reportCount = Array(repeating: 0, count: id_list.count)
    
    var test = [String:Int]()
    
    var res = [String:[String]]()
    var check = [String]()
    
    var lasttttt = Array(repeating: 0, count: id_list.count)
    var cnt = 0

    // 유저가 신고한 ID
    for x in 0 ..< report.count {
        
        let arr = report[x].components(separatedBy: " ")

        for y in 0 ..< id_list.count {
            if id_list[y] == arr[0] {
                if(!reportID[y][0].contains(arr[1])){
                    reportID[y][0] = reportID[y][0] + arr[1]
                    res.updateValue(reportID[y], forKey: id_list[y])
                }
            }
        }
    }
    // 신고당한 횟수
    // 1,2,0,2 -> 즉, frodo 2회, neo 2회
    
    let removeDuplicate: Set = Set(report)
    let newReport = Array(removeDuplicate)
    
    for x in 0 ..< newReport.count {
        

        
        let arr = newReport[x].components(separatedBy: " ")
        for y in 0 ..< id_list.count {
            if id_list[y] == arr[1] {
                reportCount[y] = reportCount[y] + 1
                
//                if reportCount[y] >= k {
//                    reportCount[y] = 1
//                }
                
                test.updateValue(reportCount[y], forKey: id_list[y])
            }
        }
    }
    
    // check 에 k를 만족하는 결과값이 담겨있음 (정지된 아이디)
    for key in test.keys {
        if test[key]! >= k {
            check.append(key)
        }
    }
    
    for x in 0 ..< reportID.count {
        cnt = 0
        for y in 0 ..< check.count {
            if reportID[x][0].contains(check[y]) {
                cnt = cnt + 1
                lasttttt[x] = cnt
            }
        }
    }
                    
    return lasttttt
}

solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2)

//solution(["con", "ryan"], ["ryan con", "ryan con", "ryan con", "ryan con"], 3)
