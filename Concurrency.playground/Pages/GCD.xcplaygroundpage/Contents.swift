//: [Previous](@previous)

import Foundation
import PhotosUI


//Concurrency Primitive
// - POSIX thread "pthread"
// =Grand Central Dispatch (GCD)- Dispatch queue low level
//NSThread +    NSRunLoop( a way to schedule work on a single thread)
// =NSOperation (NSOperationQUeure) highlevel

// 1 CPU = 1 thread A CPU executes 1 thread at a time.  in 1CPU system time slicing is used.

//Problems you run into with concurrency(it's hard to write a correct concurrent code)
    //Race Condition
    //DeadLoack
    //Priority Inversion
    //Lock Contention
    //live lock


//GCD
//low-level
//C API
//Lightweight
//complicated/large API
//open source
//hard tp cancel


//3 Most common GCDconcepts - Dispatch Queues, Dispatch Group and Dispatch Semaphore
//ALl queues by default are backgroud queues except you use main
//for concurrent queue
//let concurrentQueue = DispatchQueue.global()

//for creating serial queue
//let queue = DispatchQueue(label: "com.lambdaSchool.GCd")

//for creating custom concurrent queue
let queue = DispatchQueue(label: "com.lambdaSchool.GCd", attributes: .concurrent)

//sync wait for the code to be done before continuing other code
queue.sync {
    print("Starting background 1")
    usleep(1000)
    print("Hello from background!")
    usleep(1000)
    print("Ending background 1")
}


print("Dispatch closure 1")




queue.async {
    print("Starting background 2")
    usleep(1000)
    print("Hello from background!")
    usleep(1000)
    print("Ending background 2")
}

print("Dispatch closure 2")

//Thread Safety using a serial queue
class ThreadSafething {
    
    private let queue = DispatchQueue(label:"com.LambdaScool.ThreadSafeThingQueue")
    private var _foo = "" //Internal property
    var foo: String {
        get {
            return queue.sync { _foo
            }
        }
        set {
            queue.sync{
                _foo = newValue
            }
        }
    }
}




//NSOPERATION
//high-level
//Objective-C
//Heavy weight
//simple API
//closed source
//simple to cancel
//Easy dependencies
let newQueue = OperationQueue()
newQueue.name  = "com.LamdaSchool.Concorrency"
newQueue.maxConcurrentOperationCount = OperationQueue.defaultMaxConcurrentOperationCount

let op1 = BlockOperation {
    print("Do this")
}

let op2 = BlockOperation {
    print("Do thsi at the same time")
}

let op3 = BlockOperation {
    print("Do this when both are done ")
}

op3.addDependency(op1)
op3.addDependency(op2)

newQueue.addOperation(op1)
newQueue.addOperation(op2)
newQueue.addOperation(op3)

newQueue.waitUntilAllOperationsAreFinished()

print("Done!")


//Custom OPeration

//Processing an image with ustom Operation
//class ImageProcessingOperation: Operation {
//
//    init(image: UIImage) {
//        self.image = image
//        super.init()
//    }
//
//    override func main() {
//        //Process the image, which takes a while
//    }
//    
//    var image: UIImage 
//}



