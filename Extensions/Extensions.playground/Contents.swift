import UIKit

var topic = "Extensions"
print(topic)

//Extension is like adding more functionality to the prewritten things

// Extensions add new functionality to an existing class, structure, enumeration, or protocol type

//As we know, "Double" is a class written by Apple Developers, Now we don't have access to pre-written Double Class, so to add functionality in pre-written class, we use extensions.

//This includes the ability to extend types for which you don’t have access to the original source code (known as retroactive modeling)

extension Double {
    
    func convertToFahrenheit()-> Double {
        
        return ( ( self*1.8 ) + 32 )   //Here self is like "This" keyword
    }
    
    func convertToCelsius() -> Double {
        
        return ( (self - 32) / 1.8)
        
    }
    
}


var celsiusTemp:Double = 23

var fahrenTemp:Double = 74


print("Celsius to fahrenheit is \(celsiusTemp.convertToFahrenheit().rounded())")

print("Fahrenheit to Celsius is \(fahrenTemp.convertToCelsius().rounded())")



extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// Prints "One inch is 0.0254 meters"
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// Prints "Three feet is 0.914399970739201 meters"


//Extensions can add new convenience initializers to the class, but they can't add new designated initializers or deInitializers to a class.


struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}


let defaultRect = Rect()  // here deafult initializer comes in action.

let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),  //here the memberwise initializer comes in aciton.
   size: Size(width: 5.0, height: 5.0))

print(memberwiseRect.origin.y)

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

//Now we have extended one new initializer to our Rect Structure.
//We can call 2 types of init of our Rect Struct.
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))

let memberwiseRect2 = Rect(origin: Point(x: 2.0, y: 2.0),
   size: Size(width: 5.0, height: 5.0))



//Adding subscripts to the existing type using extensions.

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}


print(53675635[0])


//---------------

extension Int {
    mutating func square() {   // we have made this function mutable, as we are changing self in this case,
        self = self * self
    }
}
var someInt = 3
someInt.square()
print(someInt)
