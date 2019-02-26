//: Playground - noun: a place where people can play

import UIKit
/*
infix operator <=>

func <=> <T>(lhs: inout T, rhs: inout T){
    let temp = lhs
    lhs = rhs
    rhs = temp
}

var a = 3.0
var b = 4.0

a <=> b

print("\(a) and \(b)")
*/

//Create a Queue

struct Queue<Element> {
    init(_ elements: [Element]) {
        items = elements.reversed()
    }
    
    
    mutating func push(_ newElement: Element){
        items.insert(newElement, at: 0)
    }
    
    mutating func pop() -> Element? {
        return items.popLast()
    }
    
    //ask Perez question about this
    mutating func clearQueue(action: (_ element: Element) -> Void){
        while let next = pop() {
            action(next)
        }
    }
    
    
   private(set) var items: [Element] = []
    
}

extension Queue: ExpressibleByArrayLiteral {
    init(arrayLiteral:  Element...) {
        items = arrayLiteral.reversed()
    }
}

//ExpressibleByArrayLiterel
var q: Queue = [42, 25]
//q.push(42)
//q.push(25)
q.pop()
q.pop()
q.pop()

//Contraint Generics
infix operator **
func ** <Number: Numeric> (value: Number, exponent: Int) -> Number {
    var result: Number = 1
    for i in 0..<exponent {
        result *= value
    }
    return result
}

let num: Int16 = 16
num ** 3

/*
//Rewrite the function with reduce
func ** <Number: Numeric> (value: Number, exponent: Int) -> Number {
    return Array(repeating: value, count: exponent).reduce(1, *)
}
 */
/*
func removeDuplicates<S: Sequence>(_ s: S) -> [S.Element] where S.Element: Hashable {
    var seen: Set<S.Element> = []
    return s.filter({ seen.insert($0).inserted })
}
 */

extension Sequence where Element: Hashable {
    func removeDuplicates() -> [Element] {
        var seen: Set<Element> = []
        return self.filter({ seen.insert($0).inserted })
    }
}

var anotherThreeDoubles = Array(repeating: 2.5, count: 4)
anotherThreeDoubles

var shoppingList: [String] = ["food", "money"]
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese" , "Butter"]
