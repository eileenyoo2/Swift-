//
//  main.swift
//  Joystick
//
//  Created by sapere4ude on 2020/12/30.
//

// [프로그래머스 조이스틱]

import Foundation

func solution(_ name:String) -> Int {
    var ans = 0
    let name = name.map({$0})
    print(name)
    for i in 0..<name.count {
        if name[i] != "A" {
            let up = name[i].asciiValue! - 65
            let down = 91 - name[i].asciiValue!
            ans += Int((up<down) ? up : down)
        }
    }

    var minMove = name.count-1
    for i in 0..<name.count {
        if name[i] != "A" {
            var next = i + 1
            while next<name.count && name[next] == "A" {
                next += 1
            }
            let move = 2 *  i + name.count - next
            minMove = min(move, minMove)
        }
    }
    return ans + minMove
}

print(solution("JEROEN"))
