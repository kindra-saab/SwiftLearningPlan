import UIKit

var topic = "Subscripts"

print(topic)



//Subscripts

//Classes, Structures and enumerations can define subscripts
//Subscripts are shortcuts for accessing the elements of list,collection or sequence.
//We need subscripts to retrieve or set value by index, rather than using getter or setter functions.




let array = [1,2,3,4]
print(array[1])

let dict = ["word":1,"thing":2]

print(dict["word"])   //returns optional 1
print(dict["apple"])  // returns nil


struct TimeTable {
    let multiplier: Int
    
    //This is how we write subscript to access the TimeTable struct using indexes.
    subscript(number:Int) -> Int {
        return number * multiplier
    }
}

let seven = TimeTable(multiplier: 7)

print("\(seven[1])")   // 7
print("\(seven[2])")   // 14
print("\(seven[3])")   // 21


//Subscripts are basically used as a shortcut for acccesing the member elements in collection, list etc.


//SSubscripts can take any no of input parameters of any type.
//also return value of any type.

//Subscripts can't use in-out parameters.

//****Subscripts Overloading?******


struct Matrix {

    let rows:Int
    let columns:Int
    
    var grid: [Double]
    
    init(rows:Int, columns:Int)
    {
        self.rows = rows
        self.columns = columns
        
        grid = Array(repeating: 0.0, count: rows*columns)
    }
    
    
    func indexIsValid(row:Int, column:Int) -> Bool {
        
        return row>=0 && row<rows && column>=0 && column < columns
        
    }
    
    subscript(row:Int, column:Int) -> Double{
        get{
            assert(indexIsValid(row: row, column: column), "Index out of Rannge")
            
            return grid[(rows*columns) + column]
        }
        
        set {
            assert(indexIsValid(row: row, column: column), "Index out of Range")
            
            grid[(rows*columns) + column] = newValue
        }
    }
    
    subscript(row:String, col:String) -> String{
        
        if(row=="row" && col=="col")
        {
            return "Query Accepted."
        }
        
        
        return "Query Not Accepted"
        
    }
    
}

var myMatrix = Matrix(rows: 2, columns: 2)





//myMatrix[5,6] = 8.9  ****This will give error.
//Index out of range

//Subscript Overloading.

print(myMatrix["row","col"])




//Instance  subscript - > Subscripts that we call on an instance of particular type.(Like we did above)

//Now, Here is type subscript -> are the subscripts that are called on type itself.

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)




//Doubts

//How dictinary is internally implemented as Subscript.
// Subscript overloading ?

//Why Enumerations are used?

enum university:Int{
    case chitkara = 1 , university
}

print(university.chitkara.rawValue)



