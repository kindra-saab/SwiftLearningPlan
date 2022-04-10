import UIKit

var topic = "Opaque Types"
print(topic)

//*** WHAT ***
//A function or method with a opaque return type hides its return value's type information.

//*** HOW ***
//Instead of providing a return type, their return value is described in terms of protocols it supports.

protocol Shape {
    func draw() -> String
}


//This Triangle structure is adopting shape class
struct Triangle: Shape {
    
    var size: Int
    
    func draw() -> String {
        var result: [String] = []
        for length in 1...size {
            
            result.append(String(repeating: "*", count: length))
            
        }
        return result.joined(separator: "\n")
    }
}
let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())
//The above example is simple.


//Now we use generics

//Here we made a structure which expects its parameter to be a structu or class which already adopted the "Shape" Protocol.
struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}


let flippedTriangle = FlippedShape(shape: smallTriangle) // Here we are passing smallTriangle which already adopted the "Shape" Protocol.
print(flippedTriangle.draw())



//Similarly,
// Here we made a structure which expects two parameters to be a struct or class which already adopted the "Shape" Protocol.
struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}
let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
print(joinedTriangles.draw())


//Suppose, if we want to pass specific arguments(only those arguments who adopted the particular protocol) to a genenric functions,

//func max<T>(_ x: T, _ y: T) -> T where T: Comparable { ... }

//where T:comparable tells us that -> T should be a type who conforms Comparable Operator



//************ Doubt  ***************
//func joinShapeFun<T>(_ x:T ,_ y:T) -> String where T:Shape{
//
//    let top = x
//    let bottom = y
//
//
//        return top.draw() + "\n" + bottom.draw()
//
//}
//
//print(joinShapeFun(x:smallTriangle, y:flippedTriangle))


//Opaque Return Type,
//An Opaque type lets the function implementation to pick the type for the value it returns in a way that is abstracted away from the code that calls the function.

//For Example->

struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}

//Here we have introduced "some" keyword
func makeTrapezoid() -> some Shape {
   
    //Here the function returns a value of some given type that conforms to the "Shape" Protocol, without specifying any particular type.
    
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(
        top: top,
        bottom: JoinedShape(top: middle, bottom: bottom)
    )
    return trapezoid
}
let trapezoid = makeTrapezoid()

print("\n \n")
print(trapezoid.draw())


//This example highlights the way that an opaque return type is like the reverse of a generic type.
//The code inside makeTrapezoid() can return any type it needs to, as long as that type conforms to the Shape protocol, like the calling code does for a generic function


//We can also combine opaque return type with generics.

func flip<T: Shape>(_ shape: T) -> some Shape {
    return FlippedShape(shape: shape)
}


func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
    JoinedShape(top: top, bottom: bottom)
}

let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
print(opaqueJoinedTriangles.draw())



//Difference between Opaque return types and Protocol return Types.

//***********************************
//Suppose there are two functions,
//
//One function is returning an opaque type of some protocol
//&
//Another function is returning a same protocol only,
//
//Then , what is the difference between these two return types ?

//******  For Example *******

// 1st Function.
func opaqueFlip<T: Shape>(_ shape: T) -> some Shape {
    
    return FlippedShape(shape: shape)
}

//&

//2nd function is ->

func protoFlip<T: Shape>(_ shape: T) -> Shape {
    
    return FlippedShape(shape: shape)
}


// Now the above two functions has the same body, But how they are different from each other.
//The "protoFlip" function returns isn't required to always have the same type- it just has to conform the "Shape" Protocol.



func invalidFlip<T: Shape>(_ shape: T) ->  Shape {
//    if shape is Square {
        return shape // Error: return types don't match
//    }
//    return FlippedShape(shape: shape) // Error: return types don't match
}


protocol Container {
    associatedtype Item
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
extension Array: Container { }


func makeOpaqueContainer<T>(item: T) -> some Container {
    return [item]
}
let opaqueContainer = makeOpaqueContainer(item: "maf")
let twelve = opaqueContainer[0]
print(type(of: twelve))
