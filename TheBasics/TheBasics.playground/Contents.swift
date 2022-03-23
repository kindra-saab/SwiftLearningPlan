import UIKit

// can't be changed later(constants)
let fixedCount = 10


// this can be changed(variables)
var variableCount = 2

// any no of declarations in single line
var a=1,b=2,c=3
//print(a,b,c)




//Type Annotaions

var name: String
name = "jatin"
print(name)

let firstName, lastName : String

firstName = "jatin"
lastName  = "kindra"

print("Hello, My name is ", firstName, " ", lastName);


//Variables, constants names can be any
//except, whiteSpace character, can't start with number etc.

//even emojis can be variable name


//*****Error*****
//let ☺️🙂 = "smiling"
//print(☺️🙂)

let 🐶 = "dog"
print(🐶);



// if you want to name your variable name same as keyword name, then put it in (`)
// but not recommended
let `let` = 10
print(`let`)


//Print Function
//print(_:separator:terminator:)

//By Default terminator is line break

//using constants in print statement
print("Hey, My Name is \(firstName)")


//Semicolons are not required in swift
// but if we want to use multiple statements in single line, then semicolon is required

let 🎂 = "birthday"; print(🎂)


//min and max value of UInt64(Unsigned Int 64 Bit)
print(UInt64.min);
print(UInt64.max);

//Float as precise as 6 decimal places
//Double - 15 Decimal Places


//Swift - type saFE language
// if variable is of type string, you can't pass integer in it.

// type inference - swift automatically picks up the type according to inital value we provide


// for the floating point numbers, swift by default inferred it as double


//Numeric Literals

//decimal - No Prefix
//binary - 0b prefix
//octal - 0o  prefix
//hexadecimal - 0x prefix


//For Decimal Numbers

//1.25e2 = 1.25 * 10^2
//0xFp2 = 15 * 2^2


//Type Conversion

//********************************
//let cannotBeNegative: UInt8 = -1
// UInt8 can't store negative numbers, and so this will report an error

//********************************
//let tooBig: Int8 = Int8.max + 1
// Int8 can't store a number larger than its maximum value,
// and so this will also report an error

//Readability
let readable = 1_00_0000_00
print(readable);


let integer = 4
let double = 1.2645634


//****This will give error because type of both the variables are different
//print(integer + double);

//*****to get rid of the above error
//we should do

//Explicit Type Casting
let newVariable = integer + Int(double)
print(newVariable)

//OR

let newVar2 = Double(integer) + double
print(newVar2);

//*************Is this is implicit Type casting ?
print(1 + 3.122334)



//TypeAlias for giving existing name to any Data Type

typealias apnatype = Int

print(apnatype.min)  //here apnaType referred to as (Int)



//Boolean Types
//Basic like in c,C++
//true, false
//but integer cannot be subsituted to boolean


//let one = 1
//*********This will give error for the reason mentioned above
//if one
//{
//    print("Hey")
//}


//TUPLES
//Tuples group multiple values into a single compound value.
//Values can be of any Type

let status = (200, "OK")
// It is of type (Int, String)
//It consists of any types

print(status)

//destructuring(decomposing)

let (first, second) = status
// If we want to take only one value, then put underscore in the place of seconf parameter

print(first, second)

// we can also access by indexing

print(status.0, status.1)

//we ca give name also to the individual tuple values

let details = (name : "jatin" , age: 21)

print(details.name, details.age);


//Optionals
//we use optionals , when value of variable may be absent

let numberString = "123"
let numberInt = Int(numberString)

//numberInt is of type Int?, because if string cannot be converted to int, it returns nil.

print(numberInt)

var location:String?

print(location)  // by default nil

location = "Gurgaon, India"



if location != nil {   // here we confirm that our variable is not nil.
    
    print(location!)    // here we do forced unwraping.
    
}


//This is another method, for accessing the optional value
//This is called optional Binding

if let locationName = location {  // if location contains null, this if statement would not run
    print(locationName)
}


if let firstNumber = Int("4") {   //If "4" can be converted to Integer 4, then firstNumber will contain 4, and this if statement leads to true
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}


//***********************
//Implicit Unwrapped Optional
//Implicitly unwrapped optionals are useful when an optional’s value is confirmed to exist immediately after the optional is first defined and can definitely be assumed to exist at every point thereafter.

//Doubt - What is the use then ?

let newLocation:String! = "Bangalore,India"
print(newLocation)






