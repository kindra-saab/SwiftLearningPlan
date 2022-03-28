import UIKit

var topic = "Closures"
print(topic)

//Functions are first-class citizens, they can declared as variables also.


//In Swift, a closure is a special type of function without the function name. For example,


//{
//  print("Hello World")
//}


//Closures!!

//{
//    (parameters) -> returnType in
//    //
//}

// Statement inside {} is a closure body.

//This is closure body.
var greet = {
    print("Hey Fam!!")
}

greet()


//Closures can also accept parameters.

// closure that accepts one parameter
//"in" is a keyword that specifies that after this , body of closures starts.
let greetUser = { (name: String)  in
    print("Hey there, \(name).")
}

// closure call
//Unlike function, we call the closure without mentioning the parameter name.
greetUser("Jatin")


func calculator(n1:Int, n2:Int, operation:(Int, Int) -> Int) -> Int {
    
    return operation(n1,n2)
}


// This is how we make closure from function
//{ (no1:Int, no2:Int)->Int in
//    return no1*no2;
//}


//Methods of calling calculator function using closures

calculator(n1: 2, n2: 3, operation:{ (no1:Int, no2:Int)->Int in
        return no1*no2
    
})

//Above statement can be shortened by omiting the data type and return type, swift automatically type inferred.

calculator(n1: 2, n2: 3, operation:{ (no1, no2) in no1*no2 })

//Above statement can be more shortened
// $0 - 1st parameter
// $1 - 2nd parameter and so on....


print(calculator(n1: 2, n2: 3, operation:{ $0*$1 }))



//Trailing closure

// if the last parameter in your function is a closure, the we can actually omit the last parameter name.


print(     calculator(n1: 2, n2: 3) { $0 * $1}     )   // trailing closure,


//

let array = [5,6,7,8,9]

//func addOne(no:Int) -> Int
//{
//    return no+1
//}
//
//array.map(addOne)

//Now using closures, how can we shorten the above function

let newArr = array.map({(no) in no+1})
print(newArr)

//Line 100 can be more shortened as

//let newArr = array.map(){$0+1}



//Capturing the Reference
func makeIncrementer(forIncrement amount:Int) -> ()->Int {
    
    var runningTotal = 0
    
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    return incrementor
    
}


//Capturing the References

//Now whenever we call a returned incrementor function, it uses the "runningTotal" and "amount" variables, but from where ??
//These variables are not present in the incrementor function body
//SO, this incrementor function captures the refrence of these variables from the surrounding functions


var receivedFun = makeIncrementer(forIncrement: 10)

//Now, receivedFun function is referring to the incrementor function()

print(receivedFun())

print(receivedFun())



//simply converting function into closure,

let additionClosure: (_ num1: Int, _ num2: Int) -> Int =
{
    (_ num1: Int, _ num2: Int) -> Int in
    return num1 + num2
    
}

print("Addition is \(additionClosure(1,1))")



//**********   Doubts  **********
//1. Escaping/Non-Escaping Closures
//2. Autoclosures.




