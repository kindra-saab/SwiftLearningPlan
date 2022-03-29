import UIKit
import Foundation

var topic = "Structures and Classes"

print(topic)

//class Employee
//{
//
//    var name:String
//    var age: Int
//    var salary:Double
//}

//All the initializer methods must be initialized by using initilizer method or usiong default   values, otherwise it will give
//error
//*********The below line will give error     ***********
//let person1 = Employee()

//struct Resolution {
//
//    var height:Int
//    var width:Int
//}
//
//
//let person2 = Resolution(height: 10, width: 20)



struct Resolution {
    var width = 0
    var height = 0
}


class VideoMode {
    var resolution = Resolution()
    var interlaced=false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()



print("The width of someVideoMode is \(someVideoMode.resolution.width)")



//Struuctures and Enumerations are Value Types.

//  A value type is a type whose value is copied when it’s assigned to a variable or constant, or when it’s passed to a function
//In swift, all the basic types - Int, float, boolean, string, array and dictionaries are of value type.

//*******Point to note _>
//Collections defined by the standard library like arrays, dictionaries, and strings use an optimization to reduce the performance cost of copying. Instead of making a copy immediately, these collections share the memory where the elements are stored between the original instance and any copies. If one of the copies of the collection is modified, the elements are copied just before the modification. The behavior you see in your code is always as if a copy took place immediately.


//suppose,

let hd = Resolution(width: 1920, height: 1080)

let cinema = hd
//Here a copy of "hd" is made and this new copy is assigned to cinema
//Even both the instances have the same value, but they are completely different behind the scene;

//now if i change the value of cinema.width, it doesn't changes the value for hd.cinema



//Classes are of reference types.


let tenEighty = VideoMode()   //Here i created an instance of class VideoMode

tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

//Now if i assigned this instance to a new variable,

let  alsoTenEighty = tenEighty

//Now "tenEighty" and "alsoTenEighty" refers to the same memory location

//If i change some property of tenEighty , that property also changes for the "AlsoTenEighty"

alsoTenEighty.frameRate = 60.0

print(tenEighty.frameRate) // see here, the frameRate property of tenEighty also changes.


//**********  Important Note ***********
//Note that tenEighty and alsoTenEighty are declared as constants, rather than variables. However, you can still change tenEighty.frameRate and alsoTenEighty.frameRate because the values of the tenEighty and alsoTenEighty constants themselves don’t actually change. tenEighty and alsoTenEighty themselves don’t “store” the VideoMode instance—instead, they both refer to a VideoMode instance behind the scenes. It’s the frameRate property of the underlying VideoMode that’s changed, not the values of the constant references to that VideoMode.



//Identity Operators.

//To check whether constants/variables refers to the same instance of class or not ?


//Identical to (===)
//Not Identical to (!==)

if tenEighty === alsoTenEighty {
    
    print("They both refers to the same instance")
}

// === and == both have different meanings.

//Identical means that two constants or variables refers to the exactly the same class instance.
//where, Equal(==) means , two instances are eqaul or equal in value.

//Memory refrence is swift is like pointers in c/c++.

