//: Playground - noun: a place where people can play

import Cocoa

var x = 42

var lock  = NSLock()

//RACE CONDITION
//"Non-Determinism"
//deterministic code -> code where we always know the order in which things will happen

//Mutually Exclusive (Mutex)
// -LOCK
//  -simple lock
//  -recursive lock
//Semaphore
//Serial queue


//inside the lock is the critical session
DispatchQueue.concurrentPerform(iterations: 10) { iteration in
    lock.lock()
    print("non-deterministic order \(iteration + 1)")
    var scratch = x
    scratch += 1
    x = scratch
    lock.unlock()
}

print(x)


let q = DispatchQueue(label: "xInctrmemter")// serial queue
for i in 0 ..< 10 {
    q.async {
        print("iterations: \(i)")
        var localX = x
        localX += 1
        x = localX
    }
}

//PRIORITY INVERSION
// - a high priority task is stuck waiting for a low priority task

//QOS = quality of Service determines priority of task

//DEADLOCK
//-- A or B queue wating for each otther and none never executes

//LIVELOCk

//STARVATION
//-- one resources monopolising resources

//LOCK CONTENTION
//--too many people fighting for lock
//--BIKESHEDDING too many debate on the trivial.






















