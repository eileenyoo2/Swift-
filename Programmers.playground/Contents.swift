import UIKit

func solution(_ x:Int) -> Bool {
    var s1: Int
    var s2: Int
    var s3: Int

    s1 = x / 10
    s2 = x % 10
    
    s3 = s1 + s2
    
    if x % s3 == 0 {
        return true
    } else {
        return false
    }
}
