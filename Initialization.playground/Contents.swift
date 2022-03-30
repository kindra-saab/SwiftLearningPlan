import UIKit

var topic = "Initialization"

print(topic)


//Classes and structures must set all of their stored properties to an appropriate initial value by the time an instance of that class or structure is created. Stored properties can’t be left in an indeterminate state.


//Initializers - > are function only like constructors in c++.

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()  // as soon as we create an instane of the fahrenheit structure,
//init() method calls automatically
print("The default temperature is \(f.temperature)° Fahrenheit")


// we can write default values also,like -
//
//struct Fahrenheit {
//    var temperature = 32.0
//}


// we can also provide parameters to the init methods,

//we can make two init methods with the same parmeter count and same type, but then we can't use _ wala syntax in parameter.


struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
print(boilingPointOfWater.temperatureInCelsius)
// boilingPointOfWater.temperatureInCelsius is 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print(freezingPointOfWater.temperatureInCelsius)
// freezingPointOfWater.temperatureInCelsius is 0.0



