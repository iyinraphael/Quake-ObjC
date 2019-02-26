import Foundation
import PhotosUI

//class Atomic<T> {
//
//    private let queue = DispatchQueue(label:"hreadSafeThingQueue")
//    private var privateValue: T
//
//    init(_ value: T) {
//        privateValue = value
//    }
//
//    var value: T {
//        get {
//            return queue.sync { privateValue
//            }
//        }
//        set {
//            queue.sync{
//                privateValue = newValue
//            }
//        }
//    }
//}
//
//let atomicInterger = Atomic<Int>(42)
//let atomicString = Atomic("Hello World")
//
//
////Dispatch group
//
//let group = DispatchGroup()
//
//for i in 0 ..< 10 {
//
//    group.enter()
//
//    DispatchQueue.global().async {
//        usleep(useconds_t(i * 1_000_000))
//        print("Doing work #\(i+1)")
//
//        group.leave()
//    }
//}
//
//group.notify(queue: .global()) {
//    print("all my work is done")
//}

//Dispatch Semaphore
//- one time notification that a thing has happened

let semaphore = DispatchSemaphore(value: 0)

DispatchQueue.global().async{
    usleep(5_000_000)
    print("work is done")
    semaphore.signal()
}

print("about to wait for the work to happen")

semaphore.wait()
print("signal is fired")


