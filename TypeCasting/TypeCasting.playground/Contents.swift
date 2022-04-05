import UIKit

var topic = "TypeCasting"
print(topic)

//Type Casting in swift is implemented with "is" and "as" operator.

//TypeCasting is a way to check the type of the instance.

//We have 3 classes.

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}


//These are 2 child classes of the base class.
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

//Now we create 1 array which stores 2 "movie" objects and 3 "songs" objects.


let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

//Swift automatically infers the type of the "library" array as "MediaItem" even though objects are of child classes.
//When we iterate this array, we recieve mediaItem objects

//TypeCheck operator (is)
//This operator is used to check whether an instance is of certain subclass type.


var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {  // This is how "is" operator works.(item is movie returns true if the current MediaItem is a movie instance and "false" if not.
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("MovieCount is \(movieCount)")
print("songCount is \(songCount)")


//Downcast
//TypeCast Operators (as?  ,  as!)



//Use the conditional form of the type cast operator (as?) when you aren’t sure if the downcast will succeed.
//This form of the operator will always return an optional value, and the value will be nil if the downcast was not possible


//Use the forced form of the type cast operator (as!) only when you are sure that the downcast will always succeed. This form of the operator will trigger a runtime error if you try to downcast to an incorrect class type.


for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}


// So the "item" in the for loop is a "mediaItem" instance,
//Its posible that it might be a "movie", it might be a "Song" or just a "mediaItem" only,


//Because of this uncertainty, the as? form of the type cast operator returns an optional value when attempting to downcast to a subclass type


// “if let movie = item as? Movie” -> This can be readed as ->
//  “Try to access item as a Movie. If this is successful, set a new temporary constant called movie to the value stored in the returned optional Movie.”



//   *************
//Any and AnyObject.

var things: [Any] = []

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })



for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

let optionalNumber: Int? = 3
things.append(optionalNumber)        // Warning
things.append(optionalNumber as Any) // No warning
