//
//  main.swift
//  GetTheDayOfTheWeek
//
//  Created by kant on 2022/10/01.
//

import Foundation

// 배열 사용방법
func solution(_ a:Int, _ b:Int) -> String {
    let months = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let day = ["FRI", "SAT", "SUN", "MON", "TUE", "WED", "THU"]
    var totalDay = 0
    
    for idx in stride(from: 0, to: a-1, by: 1) {
        totalDay += months[idx]
    }
    
    totalDay =  totalDay + (b-1) // 1/1일 기준이므로 -1 사용
    
    return day[totalDay % 7]
}

// DateFormatter 사용방법
func solutionWithDateFormatter(_ a:Int, _ b:Int) -> String {

    let weekDayArray = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]

    var formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    formatter.dateFormat = "yyyy-MM-dd"

    let inputDay = formatter.date(from: "2016-\(a)-\(b)")
    let calendar = Calendar(identifier: .gregorian)
    let component = calendar.dateComponents([.weekday], from: inputDay!)

    return weekDayArray[component.weekday! - 1]
}

print(solution(5, 24))
print(solutionWithDateFormatter(5, 24))
