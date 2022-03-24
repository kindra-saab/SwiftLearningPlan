import UIKit

var topic = "Basic Operators, 24th March 2022"
print (topic);

//Types of Operators
//1.unary - single operand
//2.binary - two operands
//3.ternary - three operands

//Assignment operator

let name = "jatin"
let (age, address) = (21,"Delhi")
print("Hello My Name is \(name), I'm from \(address)");


let x = 1;
let y = 2;


//******This is invalid in Swift**********
//if x=y{
//    print("Hello Ji !!")
//}


let no1 = 30
let no2 = 4

print(no1%no2)

// in modulo, sign of second operand is ignored, so (a%b is equal to a%(-b))
print(no1%(-no2))

//if a is negative
print((-no1)%no2) // gives neative result

//compound Assignment Operators
let a = 10
//a+=10 -> a = a+10

//comparison Operators
//**********These All Operators returns  (Bool) values, Either true or False.
//==
//!=
//>
//<
//>=
//<=
//*****These above operators are not applicable on bool values itself

//print(true<false)  ***No sense

//There are two more operators -
//1. ===
//2. !==
//****These two operators will be covered after classes and objects Concepts


//****** We can compare Tuples also , But there are 2 conditions*******
//1. They should have the same type.
//2. They should have same no of values

if (1, "zebra") < (2, "apple")
{
    print("compared  true !!")
}

if (3, "apple") < (3, "bird")
{
    print("compared true !!")
}

if (2, "dog") == (2, "dog")
{
    print("compared equal")
}

//In the example above, you can see the left-to-right comparison behavior on the first line. Because 1 is less than 2, (1, "zebra") is considered less than (2, "apple"), regardless of any other values in the tuples. It doesn’t matter that "zebra" isn’t less than "apple", because the comparison is already determined by the tuples’ first elements. However, when the tuples’ first elements are the same, their second elements are compared—this is what happens on the second and third line.


//Left to Right comparison, first, 1st value will be compared, then it comes to second and so on.....


//if ("blue", false) < ("purple", true)
//{
//    print("true")
//}
//**************Above if statement gives error, as boolean cannot be compared


//Ternary Operators same as we did before.

let p = 1;
let q = 2;

let value = p < q ? "yes" : "no";
print(value)


//Nil - Coalescing Operator
// It is the shorthand for this code - ( a!=nil ? a! : b)



var  str : String?
//str = "Dubai"

let location = str ?? "New Delhi"
print(location)


//Closed Ranged Operator
for index in 1...5
{
    print(index)
}

//Half Ranged Operators(a..<b)
//The half-open range operator (a..<b) defines a range that runs from a to b, but doesn’t include b.

let os = ["ios", "windows", "linux"]

for index in 0..<os.count {
    print(os[index])
}

//One Sided Ranges

for index in [1...] {  //start from index 1 goes till last
    print(os[index]);
}


for index in [...1] {  //start from index 0 , goes till 1st index
    print(os[index]);
}


let range = ...5

//***********  doubt
//print(type(of: range))  // PartialRangeThrough<Int>

print(range.contains(1))


//Logical
//!, && , ||

//In &&, If first value is false, 2nd value will not be evaluated ( Short Circuit Evaluation)
// Similarly in ||, if first is true, 2nd won't we evaluated
// If more than 1 operator is used in 1 line, we can add parenthesis to improve readability.













