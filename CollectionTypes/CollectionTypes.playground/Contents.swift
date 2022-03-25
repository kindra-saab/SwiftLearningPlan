import UIKit

let topic = "Collection Types"

print("Today's topic is \"\(topic)\"")

//3 Collection Types - Array, Set, Dictionaries
//Array - ordered Collection
//Set - unordered collection of unique values
//Dictionaries - un-collec of key-value pairs.

//They are Mutable

//1. *******   Array   *********

var arr:[Int] = []; // empty array
print(arr);

arr.append(1)

print(arr)

//arr = [] // again make it empty

//we can also create like this

var arr2 = Array(repeating: 3, count: 5)
print(arr2)

// we can create new array, by adding 2 arrays

var arr3 = arr + arr2
print(arr3)


//Another way
var shoppingList = ["Milk" , "Bread"] // automatically inferred as String type array

print(shoppingList)

//Adding new item

shoppingList+=["Butter"]
print(shoppingList)

shoppingList.append("Cheese")
print(shoppingList)

// count the items
print(shoppingList.count)


//Check if is empty

if shoppingList.isEmpty {
    print("Shopping List is Empty")
}
else{
    print("It has Items")
}

//Accessing

print(shoppingList[0]) // using indexing


//********Error
//shoppingList[shoppingList.count] = "chocolate"  // runtime error - > because the index we are trying to acess is not valid


// replaces existing value

shoppingList[1...3] = ["Bananas", "apple", "mango"]  // replaces indexes from 1 to 3 with these new values

print(shoppingList)


//insert at particular index and shift all other elements

shoppingList.insert("Coffee", at: 0)
print(shoppingList)

//similarly remove and shift

shoppingList.remove(at: 3)
print(shoppingList);

// similarly more functions

//shoppingList.removeFirst()
//print(shoppingList)

//shoppingList.removeLast()
//print(shoppingList)

//shoppingList.removeSubrange(0...1)
//print(shoppingList)

//Iterating over array

for item in shoppingList {
    print(item, terminator: " ")
}

//if you want index also while iterating, use enumerator() function, it will return tuple
//print(shoppingList.enumerated())

for (idx, val) in shoppingList.enumerated(){
    
    print("Item \(idx+1): \(val)")
}


//******* SETs ********

var set = Set<Character>()  // empty set
print(set.count)

set.insert("a")
print(set)

set = ["b", "c", "d"]
print(set)



//another method

var newSet: Set<String> = ["MAF", "Dubai", "India"]
print(newSet)

//set cannot be inferred from array literal


// another method of declaring

var set2:Set<Int> = []
print(set2)

set2=[1,2,3]

print(set2)

var set3:Set = [4,5,6]
print(set3)

// certain functions of set are available
//1. isEmpty returns boolean

if set3.isEmpty {
    print("Set3 is empty")
}


set3.insert(5)
print(set3)


//.remove() returns the optional value and removes also

print(set3.remove(5))

set3.insert(8)
set3.insert(9)


// there is no order while printing in this
for item in set3
{
    print(item)
}

print("\n")

//if you want specific order

for item in set3.sorted()
{
    print(item)
}



//Performing set operations, like uniion, intersection


let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]


let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true

print(houseAnimals.isStrictSubset(of: farmAnimals)) // it checks for < or >
// but normal checks for <= , >=


//Dictionaries - Unordered but in key value pairs

// creating empty Dictionary

var dict: Dictionary<Int,String> = [:]

print(dict)

//shorthand for the above declaration

var dict2:[Int: String] = [:]
print(dict2)

dict[1]="One" //now it has one kwy value pair (1->one)

dict2[4]="four" // now it also has one key value pair (4->four>


print(dict)
print(dict2)


//var variable:Int?
//print(variable)

var details:[String:String] = ["Name":"Jatin", "Age":"21", "Address":"New Delhi"]

print(details)

//isEmpty function is also for details

print(details["Name"]) // returns optional


//Iterating over dictionaries

//retrurns tuple
for (key, value) in details
{
    print("\(key):\(value)")
}

for keys in details.keys{
    print("Key is :\(keys)")
}

for values in details.values{
    print("Values is:\(values)")
}

print(details.keys)


//updating a value for particular key and get the old value

//It returns an optional.
if let oldValue = details.updateValue("Gurgaon", forKey: "Address")
{
    print("Old Address is \(oldValue)")
}

// if key not exists, new key will be addedd.
if let oldVal = details.updateValue("Chitkara University", forKey: "University")
{
    print("Old Address is \(oldVal)")
}

//print(oldVal)
print(details)

//We can delete a key by setting its value to 'nil'

details["Address"] = nil;

print(details["Address"])

// now similar to updateValue, there is removeValue

if let removeVal = details.removeValue(forKey: "Address"){
    
    print("Removed Address\(removeVal)")
    
}
else
{
    print("Address Key Not Found")
}
