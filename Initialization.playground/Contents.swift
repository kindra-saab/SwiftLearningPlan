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


//Default Initializers.

//As this class contains the default values of the properties,
//So, when we create an instance of this class, automatically a default init will be called and initializes its values.
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()


//For the structures, They automatically recieves a memberwise initializer.

struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

//we don't have to explicitly initializes the initializer().





//*********************

//Designated and Convenience Initializer.


//Designated Initialier ensures that the object is ready to be used and all of its properties are initialized.
//Basically Simple Initializer is a Designated Initializer.

//And Convenience initializers are the one which must call the designated initializer to ensure that all the properties must be
// set and then we provide custom values to the class members.



//Certain rules for designated and convenience initializer.

//Delegate Initializers must always delegate up.
//Convenience Initializer must always delegate across.

class Person{
    
    var name:String
    var age:Int
    var address:String
    
    //This is designated Initializer.
    //It make sures that all the properties are initialized.
    init()
    {
        name = "Not Provided"
        age = 0
        address = "Not Provided"
    }
    
    convenience init(_ name:String, _ age:Int , _ address:String)
    {
        //called the designated initializer to ensure that our object is ready to go.
        self.init()
        
        //set Any other properties or custom code to initialize for this scenario
        
        self.name = name
        self.age = age
        self.address = address
        
    }

}

var jatin = Person()

print("\(jatin.name)  \(jatin.age)  \(jatin.address)")

jatin = Person("jatin", 21, "New Delhi")

print("\(jatin.name)  \(jatin.age)  \(jatin.address)")




//Two Phase Initialization

//  1st Phase -> Each stored property is assigned an initial value by the class that introduced it.
// 2nd phase ->  Each class is given the opportunity to customize its stored properties further before the new instance is considered ready for use.






