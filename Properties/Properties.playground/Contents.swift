import UIKit

var topic = "Properties"

print(topic)

//Structure or Classes are just bluePrint, which contains properties and methods.


//Initializers are the functions that called when we create an instance of class or Object.

struct Town {
    
    //These are 3 properties of this structure,
    let name: String
    var citizens:[String]
    var resources:[String: Int]
    
    
    //this is the method of this structure.
    func sayHello(){
        print("Hey Peeps")
    }
    
    //This is the initializer function
    //This is called when we create a new instance of our structure.
    //It is used to initialize all the properties of the srtructure.
    init( townName: String, people:[String], stats:[String:Int]){
        name = townName
        citizens = people
        resources = stats
    }
    
    
    
}

var myTown = Town(townName: "delhi", people: ["a","b","c"], stats: ["Coconuts":100])

myTown.citizens.append("d")
print(myTown.citizens)


//For the structures -> If you create an instance of structure using let keyword, then you can't change the properties of that instance even if they are declared as variables.

//But The above statement is not true for Classes.



//***Lazy Properties****

//Lazy properties are only created or initialized when the property is first accessed.
//For Example.


class DataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a nontrivial amount of time to initialize.
    */
    var filename = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    
    //We have made this property as lazy, because the DataImporter class takes some time to create an instance of it,
    //it will only create instance of DataImporter class, when this lazy var is used first.
    lazy var importer = DataImporter()
    var data: [String] = []
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()


//Stored Properties - the properties that we manually set.
//Stored properties are simple , like we used to store properties in the classes,
//See above example .



//***** Computed Properties

//getters

let pizzaInInches = 12

//This is the getter.
//var numberOfSlices:Int{
//    return pizzaInInches - 4
//}


//If you want to write getter completely

//var numberOfSlices:Int{
//    get{
//    return pizzaInInches - 4
//    }
//}


//Setter
//
var numberOfSlices:Int{
    get{
    return pizzaInInches - 4
    }
    set{
        print("The new value of numberOfSlices is \(newValue)")  //this block of get imediately, whenever i changes the value of the numberofSlices.
    }
}



print(pizzaInInches)


print(numberOfSlices)

numberOfSlices = 100  //Now, Line no 111 will be executed.

print(numberOfSlices)


//Computed Properties,
//Properties which are calculated at the runtime.

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}


struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            
            //we can omit the return statement here , if we write single expression.
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            //The setter code is run exactly the same time, when "center" property changes.
            //In this block newValue refers to the new value we assigned to the myRect.center -> line no 161.
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}


var myRect = AlternativeRect()

print(myRect.center)

myRect.center = Point(x: 10, y: 10) //At this line, setter block will run.



//So, center will be a computed Property.
print(myRect.center)



//Read Only Properties.

//A computed property with a getter but no setter is known as a read-only computed property.




//Observed Properties.

//The property which will be observed when user changes its value.

//Suppose,

//Observed Properties have two blocks
//1. willSet {} , which executes before the value changes
//2. didSet {} , which executes after value of property changes.

var pizzaInInch:Int = 10 {
    //This below code will execute, before the value of "pizzaInInch" changes,
    willSet{
        print(pizzaInInch)  // prints old value
        print(newValue)     // prints the new value , user want to assign to pizzInInch.
    }
    
    //The below code will execute, after the value of "pizzaInInches" changes,
    didSet  {
        print(oldValue)  // It prints the old value of "pizzaInInch"
        print(pizzaInInch) // prints the new value assigned to "pizaInInch"
        
    }
}


pizzaInInch = 80

//print(pizzaInInch)

//One More Example.

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200



//Property Wrappers
//By creating a wrapper, we resist the variable to store particular values only.

@propertyWrapper    // here, we have created "TwelveOrLess" class as property wrapper which resist the variable to store values , which are less than 12.
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}


struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)
// Prints "0"

rectangle.height = 10
print(rectangle.height)
// Prints "10"

rectangle.height = 24
print(rectangle.height)
//prints 12 , as 24 is greater than 12, so due to property wrapper, value is set to 12.





