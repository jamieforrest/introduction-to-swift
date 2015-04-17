//: # Introduction to Swift
//: ## Mutability and Optionals

import Cocoa

//: ## Mutability
//: `let` names a constant
let foo = "foo"

//: You can not reassign a constant
// foo = "bar"

//: `var` names a variable
var bar = "bar"

//: You can reassign a variable
bar = "foo"

//: A constant array is immutable
let array1 = [1,2,3]
// array1[0] = 0

//: A variable array is mutable
var array2 = [1,2,3]
array2[0] = 0
array2.append(4)

//: ## Optionals
//: Optionals are constants or variables that are allowed to be nil. 
let optionalConstant1: String? = nil
let optionalConstant2: String? = "foo"
// let nonOptionalConstant: String = nil

var optionalVariable: String? = nil
optionalVariable = "foo"

//: Functions often return optionals
let m = "123".toInt()
let n = "abc".toInt()
n.dynamicType

//: You can call a method on an optional by adding a `?` If the value is nil, the result of the expression will be nil as well
m?.successor()
n?.successor()

//: You can force unwrap an optional if you are sure that the value is not nil. (If you force-unwrap a value that is nil, the app will crash.)
m!.successor()
// n!.successor()

//: Swift has a handy nil coalescing operator (a ?? b) that unwraps an optional a if it contains a value, or returns a default value b if a is nil.
let o = n ?? m

//: Swift's if-let syntax lets you unwrap and optional and bind it if it's not nil.
if let p = m {
    println("m is not nil, and p is : \(p)")
} else {
    println("m is nil")
}

//: You can also use switch-case to do something similar.
switch (m) {
case (let .Some(p)): println("m is not nil, and p is : \(p)")
default: println("m is nil")
}

