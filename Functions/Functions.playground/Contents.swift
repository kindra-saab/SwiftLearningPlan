import UIKit
import Foundation

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
func someFunction(argumentLabel parameterName:Int) -> String
{
        "Hello Maf Family!!"
}

print(someFunction(argumentLabel: 1))

//we can omit arguments label

func fun2(_ first:Int,  _ second:Int)
{
    print("\(first)  \(second)")
}

// if function has argument label, then arguments must be label when you call the function.
fun2(10, 20)



//default parameters

func fun3(param2:Int , param3:Int = 12)
{
    print("\(param2)  \(param3)")
}

fun3(param2:5)

// variadic parameters
//we can pass variable no of arguments that will be available to us as an array of the specified type...

func fun4(_ numbers:Int...) -> Int {
    
    var ans = 0;
    
    for number in numbers {
        ans += number
    }
    
    return ans
    
}

print(fun4(3,4,5,6,7,8,9))


//functions parameters are constant by default.
// To change this behaviour, we have the concept of in-out arguments,
//If you want a function to modify a parameter’s value, and you want those changes to persist after the function call has ended, define that parameter as an in-out parameter instead.


func swap(_ a: inout Int, _ b: inout  Int )
{
    let temp = a
    a = b
    b = temp
}

// we can't pass constant arguments to the function

var a = 10
var b = 20

swap(&a, &b)

print("Now a is \(a) and b is \(b)")

//Function Types

func addTwo(_ a:Int, _ b:Int) -> Int {
    return (a+b)
}

//Here in above example, (Int, Int)->Int is a function typee;

//using Function types.
// we can asign function reference to other variable also

var newFun: (Int, Int)->Int = addTwo;

print(newFun(10,20))


//Function type as paramter type
//We can also pass function as a parameter to the other function.
func funAsParam(_ mathFun:(Int, Int)->Int, _ a:Int, _ b:Int)
{
    print(mathFun(a,b))
}

funAsParam(addTwo, 90, 10)


//Function type as return type.
 // we can also return a function

func moveAhead(_ Input:Int) -> Int {
    return Input+1;
}

func moveBack(_ Input: Int) -> Int{
    return Input-1;
}

func returnFun(_ value:Bool) -> (Int) ->(Int){
    return value ? moveAhead : moveBack
}

let returnedFun = returnFun(true)

print(returnedFun(5))


//Nested Functions

//The above "returnFun" can also be written as

//func returnFun(_ value:Bool) -> (Int) -> (Int) {
//
//    func moveAhead(_ Input:Int) -> Int {
//        return Input+1;
//    }
//
//    func moveBack(_ Input: Int) -> Int{
//        return Input-1;
//    }
//
//    return value ? moveAhead : moveBack
//
//}








