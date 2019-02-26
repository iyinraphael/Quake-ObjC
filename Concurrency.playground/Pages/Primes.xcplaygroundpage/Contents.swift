

import Foundation

func isPrime(_ x: Int) -> Bool {
    if x < 2 { return false }
    if x == 2 {return false }
    for i in 2..<x{
        if x % i == 0 {
            return false
        }
    }
    return true
}



func primes(below n: Int) -> [Int] {
    var result = [Int]()
    
    for i in 3..<n {
        if isPrime(i) { result.append(i)}
    }
    
    return result
}

print(primes(below: 10))

func contention_allPrimes(upTo n: Int) -> Int {
    var primes: [Int] = []
    let lock = NSLock()
    
    DispatchQueue.concurrentPerform(iterations: n) { number in
        if isPrime(number){
            lock.lock()
            primes.append(number)
            lock.unlock()
        }
    }
}


