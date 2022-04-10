import UIKit

var topic = "Generics"
print(topic)


//Why there is a need of generics in swift.

//Suppose this is a function, which swaps value of each other

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

//This function is very strict to the integer inputs only, but if we want to make this function generic, like it can accept any type of values like (string, double etc)
//For achieving this, we have to make this function generic.

//It is more flexible to write a single function, that accepts any type of value.

//This is how we ca write the generic function.

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

//In the above function, we can pass any type of value.

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)

print("\(someString)  \(anotherString)")


var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)

print("\(someInt)  \(anotherInt)")



//Generic types.
//In addition to the generic functions, swifts enables us to define our own generic types.
//Custom classes , structures and enumerations that can work with any type like Array and Dictionary.


struct IntStack {
    var items: [Int] = []
    mutating func push(_ item: Int) {   //Here we hvae use mutating funtion because we are changing the property of our structure (value type).
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}
//This is the structure which have array of type Int.

//Now see how we write the generic version of the above code.


struct Stack<Element> {
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

// As the above structure is generic type,
//Stack(the above structure) can be used to create a stack of any valid type in swift, like array or dictionary.
//Like->

//Here we have creates a stack of string.
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")



//Extending a gneric type.
// when we extend a generic type, then all the properties are automatically available to the extension

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]  //Here access to "items" is already available.
    }
}
//Here we have added a new optional property named "topItem" in our stack.

if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem).")
}


//Type Constraints.
//There are certain constraints which we can fix on our generics
//like "Dictionary" have a constraint that their keys value types should be hashable.

//Suppose we write our own "findIndex" function.

func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

//But the above function will only run for the "String" type.
//So we will write generic function for the same.


func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

//But now one more problem arises as in line no 125 with the "==" operator,

//Not every type in Swift can be compared with the equal to operator (==). If you create your own class or structure to represent a complex data model, for example, then the meaning of “equal to” for that class or structure isn’t something that Swift can guess for you. Because of this, it isn’t possible to guarantee that this code will work for every possible type T, and an appropriate error is reported when you try to compile the code.


//Now , what we can do is ->

func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

//The Swift standard library defines a protocol called Equatable, which requires any conforming type to implement the equal to operator (==) and the not equal to operator (!=) to compare any two values of that type

// "T: Equatable"  , which means “any type T that conforms to the Equatable protocol.”

//In the above function, we can only pass that types that have already adopted the Equatable protocol.

//******    Associated Types    ********

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
//In the above protocol, we have created one associatedtype named as "Item",
//This protocol doesn’t specify how the items in the container should be stored or what type they’re allowed to be
//The protocol only specifies the three bits of functionality that any type must provide in order to be considered a Container.
//Any type that conforms to the Container protocol must be able to specify the type of values it stores.


struct IntStack: Container {
    // original IntStack implementation
    var items: [Int] = []
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}
//Now we have one struct, in which we have set the type of our associated type we defined in a protocol.

