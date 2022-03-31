import UIKit

var topic = "DeInitialization"


print(topic)


// A deInitializer is called immediately before a class instance is De-Allocated.

//Swift automatically deallocates your instances when they’re no longer needed, to free up resources.

//Classes can have atmost one DeInitialzer.


//DeInitializers are called automatically , just before the instance deAllocation takes place.

//SuperClass DeInitializer calls automatically,at the end of subclass deInitialization implementation.


class Bank {
    
    static var coinsInBank = 10_000  // no of coins bank holds.
    
    
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    
    static func receive(coins: Int) {
        coinsInBank += coins
    }
    
    
}


class Player {
    
    var coinsInPurse: Int
    
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    
    
    //DeInitializer Function.
    
    //Here this deInitializer simply returns all of the player's coins to the bank.
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}


var player1:Player? = Player(coins: 100)
print("A new player joined having \(player1!.coinsInPurse)")

//Now It will be 100 less because of the line 63.
print("Coins Left in Bank \(Bank.coinsInBank)")

player1!.win(coins: 1000)

print("Coins Left in Bank \(Bank.coinsInBank)")

print("After winning, Now player1 has \(player1!.coinsInPurse)")

//Now, if I put my Player1 = nil, then automatically, memory deallocates and deInitializer calls.

player1 = nil

//Now, The amount in the player's purse will get back to bank Money.

print(Bank.coinsInBank)

