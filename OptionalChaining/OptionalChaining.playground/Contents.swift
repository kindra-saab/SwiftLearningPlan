import UIKit

var topic = "Optional Chaining !!"

print(topic)

//Suppose , there is one nil optional, if we try to do forced unwrapping of that optional (!), then we will get run-time error.
//Here , comes the concept of Optional Chaining.

//Optional Chaining
//Optional chaining is a process for querying and calling properties, methods, and subscripts on an optional that might currently be nil


//How Optional Chaining is an alternative to forced Unwrapping.

//********  Code   ******
//class Residence {
//    var noOfRooms = 1
//}
//************************

//********  Code   ******
//class Person {
//
//    var residence: Residence?  // I have created one optional of residene type.
//
//}
//
//let person1 = Person()
//**********************



//Now if i want to access noOfRooms property of person's, then it will give error
//print(person1.residence!.noOfRooms) -> This will give error
//Beause we are doing forced unwrapping of null.

//Now, to overcome above problem, we use optional Chaining.

//*******Code******
//if let roomCount = person1.residence?.noOfRooms{
//    print("Person1 has \(roomCount) rooms")
//}
//else
//{
//    print("Unable to retrieve no of rooms")
//}
//****************



// Here are 4 Model Classes.



class Person {
    var residence: Residence?
}


class Residence {
    var rooms: [Room] = []
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}


class Room {
    let name: String
    init(name: String) { self.name = name }
}


class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
    
    func returnsSimpleString() -> String {
        
        return "Hello EveryOne !!"
    }
     
}


var person1 = Person()



//This will print "nil" as residence property is nil.
if let roomCount = person1.residence?.numberOfRooms{
    print("person1 has \(roomCount) rooms")
}
else
{
    print("person1 has nil rooms")
}


//Now, we can also attempt to set a property's value through optional chaining.


let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Huda City Center"

person1.residence?.address = someAddress
//In the above line , as LHS is nil, so right hand side will not be executed.
//This is also optional Chaining.



//Calling Methods Through Optional Chaining
//we can use optional chaining to call methods on optional value.

//func printNumberOfRooms() {
//    print("The number of rooms is \(numberOfRooms)")
//}

//Suppose if i call above function on optional value with optional chaining , the return type will be always optional, even if the return type of the above  current function is void, but if we call on optional, it will return optional.

if person1.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

//The same above thing applies when we attempt to set the property through the optional chaining.


if (person1.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}
// Prints "It was not possible to set the address."


//***********Doubt ->
//If we call  some method on optional , then it always returns optional even if the current return type of that method is different?



//Accessing Subscripts through Optional Chaining.

if let firstRoomName = person1.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// Prints "Unable to retrieve the first room name."
//as the optional is null, so we can't access subscript on it.


//Similarly, you can try to set a new value through a subscript with optional chaining:





//********* If I Access like this, why it is giving error ?  **********
//person1House[0] = Room(name: "Living Room")
//person1House[1] = Room(name: "Kitchen")

//Now I'm Asigning a value to my optional.


let person1House = Residence()
person1House.rooms.append(Room(name: "Living Room"))
person1House.rooms.append(Room(name: "Kitchen"))
person1.residence = person1House

if let firstRoomName = person1.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

//Now As my optional is not nil, It will print the first if condition.

var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]] // Swift Dictionary.


//If we access our dictionary's values, It will return optional.
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72

//As this is optional chaining, line 202,203 will run but 204 will fail, but will not give error.




//Linking Multiple Levels of Optional Chaining

// We can use multiple level of optional chaining to access deeper properties, methods and sibscripts wihtin a model.




//Two - Levels of Optional Chaining is Used Here.

if let personStreet = person1.residence?.address?.street {
    print("John's street name is \(personStreet).")
} else {
    print("Unable to retrieve the address.")
}
//person1.residence?.address? contains a valid address, but person1.residence?.address? is nil, so this calls fails.

//Now I'm trying to access street property in the above example whose return type is String? , so the return value of ->
// person1.residence?.address?.street is also " String? " , eve though two levels of optional chaining is applied.


//Now if set the proper address with street for the above example,

let personAdd = Address()
personAdd.buildingName = "Tower B"
personAdd.street = "Unitech Cyber Park"
person1.residence?.address = personAdd

if let personStreet = person1.residence?.address?.street {
    print("Person's street name is \(personStreet).")
} else {
    print("Unable to retrieve the address.")
}

//Now, the above example will run successfully.

//Now there are some rules to keep in mind while using optional chaining.

// 1. If the type you are trying to retrieve isn’t optional, it will become optional because of the optional chaining.

// 2. If the type you are trying to retrieve is already optional, it will not become more optional because of the chaining.
    // ****** ( What is refers ?)

// 3. So, if you are trying to access non-optional simple int value, in this case, optional(Int?) will be returned.




//Chaining on methods with optional return values.

if let stringGot = person1.residence?.address?.buildingIdentifier(){
    print("Yes,  we got string even if the return type is non-optional. here it is \"\(stringGot)\"")
}


