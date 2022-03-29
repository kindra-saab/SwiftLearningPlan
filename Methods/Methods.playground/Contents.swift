import UIKit

var topic = "Methods"

print(topic)

//1. Instance Methods.

//This counter class contains 3 instance methods "increment", "increment with prameters", "reset"

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}



let counter = Counter()
// the initial counter value is 0
counter.increment()
// the counter's value is now 1
counter.increment(by: 5)
// the counter's value is now 6
counter.reset()
// the counter's value is now 0


// Self property in swift, is same as "this" property we earlier studied.
//You use the self property to refer to the current instance within its own instance methods.


struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x     // Here we have used self beacuse the parameter name is same as property name.
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}


//Structures and enumerations are value types. By default, the properties of a value type can’t be modified from within its instance methods.

//By default , we cannot change the properties of structs/enumerations with instance methods,
//But if we want, we want to make that methods which changes the properties as "mutating"


struct pt {
    var x = 0.0, y = 0.0
    
    //We have made the below function as mutating function.
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var anotherPoint = pt(x: 1.0, y: 1.0)
anotherPoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
// Prints "The point is now at (3.0, 4.0)"


// we can shorten the above mutating function,

//struct pt {
//    var x = 0.0, y = 0.0
//    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
//        self = pt(x: x + deltaX, y: y + deltaY)
//    }
//}


//Type Methods.

//Instance methods are what we called on instance of class.
//We can define methods that are called on type itself, these are called type methods.

//we write type methods, using static keyword.


class SomeClass {
    
    //This is the method of class but not of any instance.
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()



//Example of type methods and properties using static keyword.



struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}


class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}


var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")




player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 hasn't yet been unlocked")
}
