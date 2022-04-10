import UIKit

var topic = "Access Control"
print(topic)

//Access Control in Swift

//Private
//File-private
//Internal
//Public
//Open



// ******** Private *********

//When we declare a type member as private, then it can only be accessed within the same class or struct. For example,

class Student {

  // private property
  private var name = "Tim Cook"

  // private method
  private func display() {
    print("Hello from Student class")
  }
}

// create object of Student class
var student1 = Student()
    
// access name property
//print("Name:", student1.name)
//The above line will give error.***********

// access display() method
//student1.display()
//The above line will give error.*************



//****  Public ****

//In Swift, when methods, properties, classes, and so on are declared public, then we can access them from anywhere.

class Animal {

  // public property
  public var legCount: Int = 0

  // public method
  public func display() {
    print("I am an animal.");
    print("Total Legs:", legCount)
  }
}

// create an object
var obj = Animal()

// access and assign value to public property
obj.legCount = 4

// access the public method
obj.display()


//In the above example ->
//We then access the public data members directly by using the codes obj1.legCount and obj1.display()





//*******  FilePrivate *******

//When we declare a type member as fileprivate, then it can only be accessed within the defined source file. For example,

class Student2 {

  // fileprivate property
  fileprivate var name = "Tim Cook"

  // fileprivate method
  fileprivate func display() {
    print("Hello from Student class")
  }
}

// create object of Student class
var stud = Student2()
    
// access name property
print("Name:", stud.name)

// access display method
stud.display()

// ******* Since the name and display() are marked as fileprivate, these data members are accessible from anywhere in the source file where it is defined.

// *******
//If we create another Swift file and try to access the fileprivate data members, we'll get an error.



// **********   Internal  or default access level **********

class Stud2 {

  // define internal property
  internal var name = "Tim Cook"
}

// create object of Student class
var studNew = Stud2()
  
// access name property
print("Name:", studNew.name)

//In the above example, we have created a class named Student with a property name. Since name is internal, we are able to access it outside the class as they are in the same module.

//If we use internal within a single module, it works just like the public access modifier.
//If we create another module and try to access the internal data members, we'll get an error.



