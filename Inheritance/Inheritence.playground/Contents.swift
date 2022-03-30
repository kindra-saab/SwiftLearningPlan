import UIKit

var topic = "Inheritence"

print(topic)


class Enemy {
    
    var health  = 100
    var attackStrength:Int = 10
    
    func move()
    {
        print("Walk forward")
    }
    
    func attack()
    {
        print("\(attackStrength) Damage")
    }
}


let skeleton = Enemy()

print(skeleton.health)
print(skeleton.attackStrength)

skeleton.health = 200

skeleton.move()


//Inheritence,

//This class can do anything that Enemy can do, but it can do lot more also than that.
class Dragon:Enemy {

    //By default, all the properties and methods Of Enemy class are available to the Dragon class.
    
    func sayHello()
    {
        print("Hello, I'm dragon")
    }
    
    
//    override var attackStrength: Int = 20
    
    // This is how we override the function of the the super class
    override func move ()
    {
        
        //Now in this also, if we want the to run the "move" function of the parent class,
        //then we do
        super.move()   // here super refers to the parent class.
        
        print("Fly forwards")
    }
    
}


let myDragon = Dragon()

myDragon.move()
print(myDragon.health) // Why this is showing old value of health ?

myDragon.health = 500
print(skeleton.health)

print(myDragon.health)

myDragon.sayHello()

myDragon.move()



//We can prevent overriding by using "final" keyword.

//Do this by writing the final modifier before the method, property, or subscript’s introducer keyword (such as final var, final func, final class func, and final subscript)

//We can even make our class as final.



//Doubts
//Line no 48 , why giving error ?
