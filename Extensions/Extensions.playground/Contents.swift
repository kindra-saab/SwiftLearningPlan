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
