import UIKit

var topic = "Enumerations"

print(topic)

//Enum is a group of related values,
//preferred to have the first letter capital of enum.

enum Directions{
    case east
    case west
    case north
    case south
}


var location = Directions.east

//after initializing first time with enum name,
// after that we can initialize with only . operator


location = .west
print(location)


//enumerations with switch statement.

//directionToHead = .south
switch location{
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

//CaseIterable keyword
//It is used to get the collection of all the cases in the enum

enum Chocolates: CaseIterable {
    case fiveStar
    case dairyMilk
    case kitKat
}

print(Chocolates.allCases)

print(Chocolates.allCases.count)
//Iterating the enums

for singleChoc in Chocolates.allCases {
    print(singleChoc)
}


//Associated Values

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

//This is the Barcode, which can take either a value of upc with an asscoiated value of type (Int,Int,Int,Int), or a value of
// "qrCode" with an associated value of String.

var productBarcode = Barcode.upc(10, 20, 30, 40)

productBarcode = .qrCode("gjhqwdgbnsailughjkbd")

//At this point, the original Barcode.upc and its integer values are replaced by the new Barcode.qrCode and its string value
//onstants and variables of type Barcode can store either a .upc or a .qrCode (together with their associated values), but they can store only one of them at any given time.

print(productBarcode)


switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}



//Raw Values.
//Enumeration Cases can come prepopulated with default values called Raw Values.

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//Implicitly assigned raw values.
enum Cities: Int{
    
    case delhi = 1 , gurgaon ,chandigarh, jaipur, Amritsar
}

print(Cities.chandigarh.rawValue)


//When strings are used for raw values, the implicit value for each case is the text of that case’s name.



//Initializing from Raw Values.


let possibleCity = Cities(rawValue: 3) // It will provide an optional because , the raw value provided can also be wrong.

print(possibleCity!)


let positionToFind = 3
if let somePlanet = Cities(rawValue: positionToFind) {
    switch somePlanet {
    case .chandigarh:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}





//*************    Recursive Enumerations   *****************



