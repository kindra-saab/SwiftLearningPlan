import UIKit

var topic = "Automatic Reference Counting"

//Swift uses Automatic Reference Counting to track and manage app's memory usage.

//ARC automatically frees up the memory used by class instances when those instances are no longer need

//Reference counting applies only to instances of classes. Structures and enumerations are value types, not reference types, and aren’t stored and passed by reference.

//To make sure that instances don’t disappear while they’re still needed, ARC tracks how many properties, constants, and variables are currently referring to each class instance. ARC will not deallocate an instance as long as at least one active reference to that instance still exists.


//Here is a simple class.
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

//Now we create 3 optional variables of the above class.
// initially assigned with 'nil' until the object is allocated.
var reference1: Person?
var reference2: Person?
var reference3: Person?


reference1 = Person(name: "John Appleseed")
//Now a strong reference from "reference1" to the new "Person" Instance.


// Now if i do

reference2 = reference1
reference3 = reference1

//Now, There are 3 strong references to this single "Person" Instance.

//Now, if do
reference1 = nil
reference2 = nil
//Now, also ARC doesn't deallocate the memory, because now also 1 strong reference is present.



//However, it’s possible to write code in which an instance of a class never gets to a point where it has zero strong references
//This can happen if two class instances hold a strong reference to each other, such that each instance keeps the other alive
//This is known as "Strong Reference" Cycle.


//How such cycle is formed, Here is an example.

class Person1 {
    let name: String
    
    init(name: String) { self.name = name }
    
    var apartment: Apartment?  //*******    Optional Property that is currenty nil
    
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    
    init(unit: String) { self.unit = unit }
    
    var tenant: Person1?       //*******    Optional Property that is currenty nil
    
    deinit { print("Apartment \(unit) is being deinitialized") }
}


var john: Person1?
var unit4A: Apartment?


john = Person1(name: "John Appleseed")  // person instance is created whose "apartment" property is "nil" right now
unit4A = Apartment(unit: "4A")         // Apartment instance is created whose "unit4A" property is "nil" right now

//Now, If I Do,

john!.apartment = unit4A
unit4A!.tenant = john
//From the line 88 and 89, strong reference cycle is made

//The "Person1" instance now has a strong reference to the "Apartment" instance, and the "Apartment" instance has a strong reference to the "Person1" instance.


//Now If i do
john = nil
unit4A = nil
//Now, also ARC not able to deAllocate the the original memory allocated because of the strong reference cycle between both of the classes.

//Now we have memory leak in our program because two chunks of memories are allocated and we don't have access to those memories.

//See diagram for proper explaination.


//***************************************************
//How to resolve Strong reference cycle beteween class Instances.
//Two ways-
//1. Weak Reference
//2. unowned Reference.

//A weak reference is a reference that doesn’t keep a strong hold on the instance it refers to, and so doesn’t stop ARC from disposing of the referenced instance.

//Because a weak reference doesn’t keep a strong hold on the instance it refers to, it’s possible for that instance to be deallocated while the weak reference is still referring to it

//Therefore, ARC automatically sets a weak reference to nil when the instance that it refers to is deallocated. And, because weak references need to allow their value to be changed to nil at runtime, they’re always declared as variables, rather than constants, of an optional type.

//Now see the example.

class Person2 {
    
    let name: String
    
    init(name: String) { self.name = name }
    
    var apartment: Apartment2?
    
    deinit { print("\(name) is being deinitialized") }
}

class Apartment2 {
    
    let unit: String
    
    init(unit: String) { self.unit = unit }
    
    weak var tenant: Person2?
    
    deinit { print("\(unit) is being deinitialized") }
}

var jatin: Person2?
var anotherJatin: Apartment2?

jatin = Person2(name: "Jatin") //Strong Reference
anotherJatin = Apartment2(unit: "IOS") //Strong Reference

jatin!.apartment = anotherJatin //Strong Reference
anotherJatin!.tenant = jatin   //Weak Reference.

//See Diagram for more clearance.

//Now if i do

jatin = nil
//Now memory for "jatin" de-allocates , as there are more sstrong reference to Person2 are available and also because of the weak bond between "tenant" and "jatin" instance, now "tenant" property will set to nil.

//Now if I do
anotherJatin = nil
//Now its memory will also be de-allocated as there are no more strong reference are available.


// ************************************
//Unowned Reference.

//Unlike a weak reference, an unowned reference is expected to always have a value.
//Now see the example.


//In this data model, a customer may or may not have a credit card, but a credit card will always be associated with a customer.
//To represent this, the Customer class has an optional card property, but the CreditCard class has an unowned (and non-optional) customer property.

class Customer {
    
    let name: String
    
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit { print("\(name) is being deinitialized") }
}



class CreditCard {
    
    let number: UInt64
    
    unowned let customer: Customer
    
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit { print("Card #\(number) is being deinitialized") }
}


var jatin2: Customer?
jatin2 = Customer(name: "Jatin 2")

jatin2!.card = CreditCard(number: 1234_5678_9012_345, customer: jatin2!)

//The Customer instance now has a strong reference to the CreditCard instance, and the CreditCard instance has an unowned reference to the Customer instance.

//Because of the unowned customer reference, when you break the strong reference held by the "jatin2" variable, there are no more strong references to the Customer instance:

//Because there are no more strong references to the Customer instance, it’s deallocated.

//After this happens, there are no more strong references to the CreditCard instance, and it too is deallocated:

//now if i do
jatin2 = nil

//The final code snippet above shows that the deinitializers for the "Customer" instance and "CreditCard" instance both print their “deinitialized” messages after the "jatin2" variable is set to nil.


//**********          Unowned Optional Reference      ************

class Department {
    
    var name: String
    
    var courses: [Course]
    
    init(name: String) {
        self.name = name
        self.courses = []
    }
    
}


class Course {
    
    var name: String
    
    unowned var department: Department
    
    unowned var nextCourse: Course?
    
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
    
}



let department = Department(name: "Horticulture")


let intro = Course(name: "Survey of Plants", in: department)
let intermediate = Course(name: "Growing Common Herbs", in: department)
let advanced = Course(name: "Caring for Tropical Plants", in: department)

intro.nextCourse = intermediate
intermediate.nextCourse = advanced
department.courses = [intro, intermediate, advanced]


//****** Doubt -> Unowned Reference and strong reference cycle for closures ********//
