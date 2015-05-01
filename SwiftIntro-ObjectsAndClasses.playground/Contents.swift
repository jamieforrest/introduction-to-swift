//: # Introduction to Swift
//: ## Objects and Classes

import Cocoa

//: ## Enum
enum Direction {
    case Up, Down, Left, Right
}

func printDirection(direction: Direction) {
    switch direction {
    case .Left: println("left")
    case .Right: println("right")
    case .Up: println("up")
    case .Down: println("down")
    default: println("error")
    }
}

printDirection(.Left)

//: Enums can also take on arbitrary raw values

enum DirectionString: String {
    case Up = "up", Down = "down", Left = "left", Right = "right"
}

func printDirectionString(direction: DirectionString) {
    println(direction.rawValue)
}

printDirectionString(.Up)

//: ## Struct
struct Person {
    var name: String
    var email: String
    var phone: String?
}

//: Structs come with their own built-in constructors
let barack = Person(name: "Barack", email: "barry@whitehouse.gov", phone: "202-456-1111")
let rick = Person(name: "Rick", email: "rick@rickroll.com", phone: nil)

//: Structs are value types
var bizarroRick = rick
bizarroRick.name = "Bizarro Rick"

rick.name
bizarroRick.name

//: Note that Arrays, Sets, and Dictionaries in Swift are structs (but copying is via copy on write)
var arr1 = [1, 2, 3]
var arr2 = arr1

arr2[0] = -1

arr1
arr2

//: ##Classes 
//: Classes are reference types and provide inheritance

class Vehicle {
    let numberOfWheels: Int
    
    init(numberOfWheels: Int) {
        self.numberOfWheels = numberOfWheels
    }
}

class Bicycle: Vehicle {
    var name: String
    
    init(name: String) {
        self.name = name
        super.init(numberOfWheels: 2)
    }
}

//: Class instances are references
let trek = Bicycle(name: "Trek")
var bizarroTrek = trek
bizarroTrek.name = "Bizarro Trek"

println(trek.name)
println(bizarroTrek.name)
