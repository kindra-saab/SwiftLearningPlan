import UIKit

var topic = "Control Flow"
print("Topic is \(topic)")

//for in loop in array

let arr = [1,2,3,4,5]

for num in arr {
    print(num)
}

//for in loop for dictionaries

let dict = ["name":"jatin" , "age":"21"]

for (key, value) in dict
{
    print("Key:\(key) and Value:\(value)")
}

// for in loop for ranges

for index in 1...10
{
    print(index)
}

// if you don't need sequence in loop

let upper = 10

for _ in 1...upper {
    print("MAF-Carrefour")
}

// not a closed range
print("\n")
for val in 1..<upper {
    
    print("MAF-Carrefour")  // it will run till (upper-1)
}



//SetInterval type of function in Swift, Iterating something after every some interval
//******Doubt**** How this is working.

//from:to:by
// start from 0 , go upto 60, 60 is exclusive and in each iteration increment by 5
for i in stride(from:0, to:60, by:5)
{
    print(i)
}

print("\n")

//from:through:by
//start from 0 , go upto 60, 60 is inclusive and in each iteration increment by 5
for i in stride(from:0, through: 60, by:5)
{
    print(i)
}

// while loop
var start = 1;
var end = 10;
while start<end {
    print(start)
    start = start + 1
}

print("\n")

// do while loop - here it is repeat while loop
// runs atleast one time
start = 10
end = 10
repeat {
    print(start)
} while start < end


//Conditional Statements Simple - if else did before.
// Switch Statement same

var alpha = "a"

// In Swift , Break statements are not required.
//The body of any case cannot be empty, must contain a executable statement , otherwise it will give error
switch alpha {
case "a","A" :     // two choices can be given
    print ("A found")
default:
    print("Not Found")

}


//Intervals can also be there in switch statement.

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// Prints "There are dozens of moons orbiting Saturn."


// Switch Cases can be tuple and ranges
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}


//where clause in switch statement.

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}



//instead of writing multiple switch cases, we can write compound cases.
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) isn't a vowel or a consonant")
}


//value bindings,
//

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}


// This is also the example of value binding.
var scores =  (70,60)
switch scores {/*from ww w .j a  va 2  s.c o  m*/
   case  (0,0):
       print("This is not good!")
   case (100,100):
       print("Perfect score!")
   case  (50...100, let science ):
        print("Math passed!")
        if science<50 {
            print("But Science failed!")
        } else {
            print("And Science passed too!")
        }
   case  (let math , 50...100):
        print("Science passed!")
        if math<50 {
            print("But Math failed!")
        } else {
            print("And Math passed too!")
        }
   default:
        print("Both failed!")
}


//Control Transfer Statements.
//Continue, break, fallthrough, return, throw.

//1. Continue
// whenever a vowel comes , then it do not append
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}
print(puzzleOutput)



//2.Break

let newDict = ["name":"jatin", "age":"21"]

for (key, value) in  newDict
{
    if(key=="jatin")
    {
        break;
    }
}

//Swift statement doesn't allow empty cases.
//break in switch statement.
let switchVar = 1;

switch switchVar {
    
case 1:
    break;
default:
    print("hey")
    
}

//3.FallThrough


//switch statements don't fall through the bottom of each case.
//That is, the entire switch statement completes its execution as soon as the first matching case is completed.

// if we add fallthrough keyword in any switch case,
//then we switch completes its execution but it also comes in default case also.

//example of fallThrough

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)



//Early Exit.
//Labeled Statements.

//Checking API Availability

//Swift reports a compile time error if you try to use api that isn't available



