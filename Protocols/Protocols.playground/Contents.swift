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



//   ****** Delegate Pattern ******

//  Simple example - my father told me to bring something from the market and I performed that action.
// Means one class is giving some work to another class for performing some action.







 
//This protocol only has one requirement.
//In order to get advancedLifeSupport certification , a person must know how to perform PCR.
protocol advancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler{
    
    var delegate: advancedLifeSupport?  // here we are using protocol as a datatype.
    //we have a delegate property which has a datatype of advacedLifeSupport.
    //The above 112 line means that ->
    //whoever(any class or struct) sets themselves as a delegates must have the advancedLifeSuport protocol adopted.
    //So, they must be able to know how to perform CPR.
    
    
    func assessSituation() {
        print("Can you tell me what happened ?")
    }
    
    func medicalEmergency(){
        
        delegate?.performCPR()
        //he don't care who is the delegate, but he knows delegate is a person who knows how to perform CPR, because type of delegate is a protocol.
        
    }
}

struct person1: advancedLifeSupport {
     
    
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("It Measures the Heart Rate")
    }
}

class Doctor:advancedLifeSupport{
    
    
    //Now when doctor is on shift, he sets himself as a delegate.
    
    init(handler:EmergencyCallHandler)
    {
        handler.delegate = self   // He is telling that I'm on shift, and assigns himself as a delegate.
    }
    
    func performCPR() {
        print("Doctor is performing cpr")
    }
    
    func useStethoscope()
    {
        print("Doctor is using Stethoscope.")
    }
}


class surgeon:Doctor {   // it automatically has protocol because surgeon is inheriting from doctor.
     
    override func performCPR() {
        super.performCPR()
        print("Surgeon is also helping doctor in performing CPR.")
    }
}
    



let emergencyPerson = EmergencyCallHandler()
let pcrPerson = person1(handler: emergencyPerson)
//This above call means I'm the one who performs CPR and listen to call when emergency person call me.


emergencyPerson.assessSituation()
emergencyPerson.medicalEmergency()
