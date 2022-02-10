import UIKit

/*
 ___ _ _                          _
| __(_) |__  __ _ _ _  ___  __ __(_)
| _|| | '_ \/ _` | ' \/ _ \/ _/ _| |
|_| |_|_.__/\__,_|_||_\___/\__\__|_|

 */

func fibNaive(_ n: Int) -> Int {
    print(n)
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    } else {
        return fibNaive(n - 1) + fibNaive(n - 2)
    }
}

//fibNaive(20) // 20 = 13s / 22 = 54 s

//var memo = [Int: Int]()
//
//func fib(_ n: Int) -> Int {
//    if n == 0 { return 0}
//    else if n == 1 { return 1 }
//
//    if let result = memo[n] {   // 처음 memo[n]은 nil 이기 때문에 이 조건문을 타지 않음
//        print("result:\(result)")
//        return result
//    }
//
//    memo[n] = fib(n - 1) + fib(n - 2)
//    print(memo[n], "n: \(n)")
//
//    return memo[n]!
//}
//
////fib(22) // 70 max
//fib(4)

// 동적 계획법 : 가장 작은 단위부터 계산하고 저장. 이를 활용해서 큰 값을 도출.
func fibo(_ n: Int) -> Int {
    var cache: [Int] = [0, 1]
    
    for num in 2 ... n {
        cache.append(cache[num-1] + cache[num-2])
    }
    return cache[n]
}

fibo(4)
