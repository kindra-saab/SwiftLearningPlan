import UIKit

var topic = "Functions"

print(topic)


func sayHello(person:String) -> String {
    
    return "Hello \(person)"
}

print(sayHello(person: "Jatin"))

//If function is returning something, we can simply ignore also.

//we can also return multiple as tuple from functions


func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}


let tupleVal = minMax(array: [2,3,4,5,6,7,8,9])

print("Min:\(tupleVal.min) Max:\(tupleVal.max)")


//If we want to return tuple as nil also, then we return the optional

func minMax2(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

// we used optional binding, as return value is optional
if let tupleVal2 = minMax2(array: [1,2,3,4,45,5]) {
    print("Min:\(tupleVal2.min) and Max:\(tupleVal2.max)")
}

// If the entire body of function is single expression, we can omit the return statement.
func sayHello2(name:String) -> String {

    "Hello \(name)"
}

print(sayHello2(name: "Jatin"))

//*******  Proper function should be like this   ********
//func someFunction(argumentLabel parameterName:Int)
//{
//
//}

//we can omit arguments label



