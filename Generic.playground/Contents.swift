//: Playground - noun: a place where people can play

import UIKit


func swap<T>(lhs: inout T, rhs: inout T){
    let temp = lhs
    lhs = rhs
    rhs = temp
}

var a = 3.0
var b = 4.0
swap(&a, &b)

print("\(a) and \(b)")
