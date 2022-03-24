import UIKit

var topic = "Strings And Characters"

print(topic)

var strliteral = "hello"
print(strliteral)


//Multiline String Literals

let alphabets = """

a b c
d e f
g h i
"""

print(alphabets)

// If you don't want line break at any line, simple put (\) at the end of that line.
let alphabets2 = """

a b c
d e f \
g h i

"""

print(alphabets2)


//********* Doubt *******
//let whiteSpaces = """
//
//    abcs
//
//    """
//
//print(whiteSpaces)

//Special Characters in String Literal

//\0 ( null character)
//\t (tab)
//\n (new line)
//\r (carriage return )
//\" (double quotation mark")
//\' (single " " " " " " )


let quote = "\"regret is better than quit\""
print(quote)

//unicode scalar value -
//u{n}, where n is equal to 1-8 digit hexadecimal number

//Print arbitarary unicode value.
print("\u{1F496}")

print("""
\"""an apple day keeps doctor away\"""
""")

// If we want to use special characters as a part of our string, then we have to use -
// Extended delimiters

print(#"Hello \n Maf Fam"#)

// and if we want to see original effect also
print(#"Hello \#n Maf Fam \n"#)


//Doubt*********
//How they both are different ?
//classess concepts ?
var emptyString = "";

var anotherEmptyString = String()

//print(emptyString, anotherEmptyString);


//String are value types
//When we pass a string to function or assigned to variable , this string value is copied.
//Means reference concept is not there.

//****** Is it ??? *******
//if two strings are same value, they point to single memory, if one of them changes, then a new memory is allocated.


for char in "Maf"
{
    print(char)
}

let singleChar:Character = "!"

let charArr: [Character] = ["M", "a", "f"]
let charStr = String(charArr)
print(charStr)

var Name = "jatin"
var lastName = "kindra"

Name.append(lastName)

print(Name)


//Adition of multiline string literals.
let first = """
one
two
"""

let second = """
three
"""

print(first+second)


let third = """
one
two

"""

print(third+second)



//String Interpolation

let mul = 3

print("\(mul) times 2.5 is \(Double(mul)*2.5)")


//If we have to use string delimiters

print(#"\#(mul) times 2.5 is \#(Double(mul)*2.5)"#)


//Unicode

//Swift string type is built from Unicode Scalar Values
//Unicode Scalar Value = 21 bit number for a character

//Swift Character type represents single Extended Grapheme Cluster.
//Extreme Grapheme Cluster -> is a sequence of one or more unicode scalar.

//é - (LATIN SMALL LETTER E WITH ACUTE, or U+00E9)
//same  é can also be represented as -  e (LATIN SMALL LETTER E, or U+0065), followed by the COMBINING ACUTE ACCENT scalar (U+0301).

//In both the above cases, é represents single swift Character,
//but in 1st case - cluster contains single scalar
// in 2nd case - cluster contains two scalars

//1st Case
let eAcute: Character = "\u{E9}"
print(eAcute)// é

//2nd Case
let combinedEAcute: Character = "\u{65}\u{301}"
print(combinedEAcute)// e followed by



var companyName = "MafRetail"
print(companyName.count)


//*********** Doubt *********
//Why strings cannotbe indexed by integer values
//***********Internally are they of  type linkedlist ? *****************
//String Indices
//different characters of strings stored at different positions ->
//to determine which character is at which position ->
//we must iterate over unicode scalar from start or from end


print(companyName[companyName.startIndex])
print(companyName[companyName.index(before: companyName.endIndex)])

print(companyName[companyName.index(after: companyName.startIndex)])

let index = companyName.index(companyName.startIndex, offsetBy: 5)

print(companyName[index])


for index in companyName.indices {
    
    print("\(companyName[index])", terminator: "\n")  //byDefault terminator is new line character.
}

//Inserting and Removing
//1. inserting single character

companyName.insert(",", at: companyName.endIndex)
print(companyName)


//2.inserting contents of another string
//******* Doubt   *********  - doubt resolved
//why this is not working ?
companyName.insert(contentsOf: " Dubai", at: companyName.endIndex)

print(companyName)

//Remove single Element
companyName.remove(at: companyName.index(companyName.startIndex, offsetBy: 10))

print(companyName)

//Remove range of Elements
let range =  companyName.index(companyName.endIndex , offsetBy: -6)..<companyName.endIndex

companyName.removeSubrange(range)

print(companyName)


//Substrings
//Make your substrings as permanent strings if you want to later purpose- reason is mentioned below :)

let greetings = "Hello, World !!"

//firstIndex return optional
let idx = greetings.firstIndex(of: ",")
let endIdx = greetings.endIndex

let finalIndex = idx ?? endIdx

let substr = greetings[..<finalIndex]
print(substr)

//The reason for the above statement -
//greeting is a string  which means it has its own memory where all its characters are stored
//Now, substr is a substring, it reuses the same memory which original string is using
//This is the reason.

//Now making our substring as permanent string, so that it will get its own memory

let substrToStr = String(substr)
print(substrToStr)




//Comparing Strings

//Two strings or two characters are said to be eqaul if their extended grapheme clusters are canonically equal
//Extended grapheme clusters are canonically equal if they have same linguistic meaning and appearence, even if they are from different unicode scalars

let fName = "My name is Jatin,\(eAcute)"
let lName = "My name is Jatin,\(combinedEAcute)"

if fName==lName {
    print("They both are equal")
}


//hasSuffix and hasPrefix in Strings

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

let detail = "MAF RETAIL, INDIA"
if detail.hasSuffix("INDIA") {
    print("Carrefour is also in India")
}






