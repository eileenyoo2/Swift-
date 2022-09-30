// 거스름돈

import Foundation

var count = 0
var money = 1260

var coinType = [500, 100, 50, 10]

for coin in coinType {
    count += 1
    money %= coin
}

print(count)
