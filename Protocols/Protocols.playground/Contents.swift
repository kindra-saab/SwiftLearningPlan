import UIKit

var topic = "Protocols"
print(topic)

//Protocols are certifications.
//We define some requirements that our classes or structure have to meet  these requirements.

//
protocol CanFly{
    func fly()
}
//Protocols can be adobtedby clases or structures

class Bird {
    
    
    var isFemale = true
    
    func layEgg(){
        if isFemale {
            print("This bird makes a new bird")
        }
    }
    
    //we can omit this
//    func fly () {
//        print("The Bird Fly")
//    }
    
}

//here we are adopting fly method from protocol
class Eagle:Bird, CanFly {
    
    func fly() {  //It implements the fly method that satisfies the requirement of canFly protocol
        print("Eagle can fly")
    }
    
    func roar() {
        print("The eagle roar")
    }
    
}


class Penguin:Bird{
    
    func swim()
    {
        print("The Penguin Swims")
    }
}


struct FlyingMuseum {
    
    func flyingDemo(flyingObject: CanFly)  // here the object expecting which contains fly method means adopted canFly protocol.
    {
        flyingObject.fly()
    }
    
}

struct Airplane: CanFly {
     func fly(){
        print("The airplane uses its engine to fly.")
    }
}


let myEagle = Eagle()
myEagle.fly()
myEagle.layEgg()


let myPenguin = Penguin()

//myPenguin.fly()   ***** gives error
myPenguin.swim()
myPenguin.layEgg()  // Our Penguin is inheriting some functionality that it shouldn't have actually.



var museum = FlyingMuseum()
//museum.flyingDemo(flyingObject: myPenguin) //The problem is why I'M able to pass eagle object even though we know penguin can't fly     *****  gives error ****

let myPlane = Airplane()
myPlane.fly()

//myPlane.layEgg()  // This is the problem   ****This will give error***



museum.flyingDemo(flyingObject: myEagle)


//we can also adopt multiple protocols comma separated
//class myClass:SuperClass, protocol1, protocol2 {
//
//}
