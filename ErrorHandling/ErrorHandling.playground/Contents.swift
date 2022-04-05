import UIKit
import Foundation

var topic = "Error Handling"

//Need ->
//consider the task of reading and processing data from a file on disk. There are a number of ways this task can fail, including the file not existing at the specified path, the file not having read permissions, or the file not being encoded in a compatible format. Distinguishing among these different situations allows a program to resolve some errors and to communicate to the user any errors it can’t resolve.


//Throwing an error lets you indicate that something unexpected happened and the normal flow of execution can’t continue

//Four Ways to Handle Error in Swift.
//1. you can propagate error from function to a code that calls the function.
//2. Using do-Catch Statement.
//3. handle the error as an optionla value.
//4. Or Assert that error wil not ocur.


//Propagating Errors using Throwing Functions.
//If you think tht your function can throw error -> you must declare it like

func canThrowError() throws -> String {
    
    return "Hey"
    //Here, we can throw error.
}

//A throwing function propagates errors that are thrown inside of it to the scope from which it’s called.


//This is how we represent error conditions
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}





struct Item {
    var price: Int
    var count: Int
}




class VendingMachine {
    
    
    
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    
    
    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Dispensing \(name)")
    }
    
}


//Now in vend method of VendingMachine class, it if any of the requirements for purchasing a snack aren't met, It will throw an error and immediately transfers program control to the block from where it is called.

//Now as this method throws an error, any code that calls it should catch or handle the errors.


let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    
    //Here we have used "try" statement before the function call, because vend function can throw error.
    try vendingMachine.vend(itemNamed: snackName)
}

//Now, how to handle errors.

var vMachine = VendingMachine()

vMachine.coinsDeposited = 10

do {
    
    //called buyFavoriteSnack method with try, because it can throw error.
    try buyFavoriteSnack(person: "Alice", vendingMachine: vMachine)
    print("Success! Yum.")
    
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
    
    
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
    
    
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
    
    
} catch {
    print("Unexpected error: \(error).")
    
    
}


//buyFavoriteSnack(person: "malai Chaap", vendingMachine: vMachine)



func nourish(with item:String) throws {
    
    do{
        try vMachine.vend(itemNamed:item)
    }
    
    catch is VendingMachineError{   //Now If the error is one of three that we defined above in enum, then this print statement will be executed, otherwise it goes to line no 154 wala catch.
        print("This is one of the error of vanding machine")
    }
    
}


do{
try nourish(with: "Hello")
}
catch{
    print("The error is not related to Vending Machine:")
}


//**********     Doubts
//Last Three topics of the documentation I didn't get.
