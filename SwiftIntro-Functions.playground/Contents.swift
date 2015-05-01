//: # Introduction to Swift
//: ## Functions

import Cocoa

//: ## Returning tuples
func parseString(string: String) -> (parsedString: String?, error: NSError?) {
    if string == "foo" {
        return ("bar", nil)
    } else if string == "baz" {
        return (nil, NSError(domain: "intro", code: -1, userInfo: nil))
    }
    return (string, nil)
}

parseString("foo").parsedString
parseString("baz").error
parseString("hey").parsedString

//: ## External and internal parameter names
func tokenize(string: String, withToken token: Character) -> [String] {
    return split(string) { $0 == token }
}

tokenize("foo,bar,baz", withToken: ",")

//: ## First-class objects and type aliases
typealias StringParser = (string: String) -> (parsedString: String?, error: NSError?)

func higherOrderParseString(string: String, parser: StringParser) -> String {
    let (parsedString, error) = parser(string: string)
    if let str = parsedString {
        return str
    } else {
        NSLog("Error parsing string: \(parsedString)")
        return "Empty"
    }
}

higherOrderParseString("foo", parseString)

//: ## Map

let ingredients = ["spam", "eggs", "bacon", "spam"]

let capitalizedIngredients = ingredients.map { $0.capitalizedString }
capitalizedIngredients

//: ## Filter

let filteredIngredients = capitalizedIngredients.filter { $0 != "Spam" }

filteredIngredients

//: ## Reduce

let shoppingList = filteredIngredients.reduce("Shopping List:") { $0 + "\n" + $1 }
shoppingList

//: ## Pattern Matching - Differences from Objective-C
//: switch statement matches any Equatable
let country = "USA"
switch country {
case "USA": println("United States")
case "GBR": println("United Kingdom")
default: println("Country not found")
}

//: switch statement matches ranges
let grade = 75.7
switch grade {
case 65...69: println("D")
case 70...79: println("C")
case 80...89: println("B")
case 90...100: println("A")
default: println("F")
}

//: switch statement matches tuples
let record = ("Jamie", 75.7)
switch record {
case ("Jamie", let grade):
    println("Jamie, you should've done better. You only got a \(grade).")
case (_, 80...89):
    println("You're not Jamie, and you got a B.")
case ("Alice", _):
    println("You didn't get a B, and your name is Alice")
case (_, _):
    println("No comment.")
}
