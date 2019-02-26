

import Foundation
import UIKit

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
//
//
//        usleep(1 * 1_100_000)
//    }
//
//    var image: UIImage
//}


class ComputeOperation: Operation {
    
    private let max: Int
    
    init(maxNumber: Int){
        self.max = maxNumber
    }
    
    override func main(){
        //when mani() finishes the operation is over
        print("starting \(max)")
        
        usleep(UInt32(max * 1_000_000))
        
        print("finishing \(max)")
    }
} 

let compute1 = ComputeOperation(maxNumber: 2)
let compute2 = ComputeOperation(maxNumber: 4)

let q = OperationQueue()

q.maxConcurrentOperationCount = 1
q.addOperation(compute1)
q.addOperation(compute2)


//circular dependency results to deadlock n
