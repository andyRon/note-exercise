class  MediaItem {
    var name:String
    init(name:String){
        self.name = name
    }
}
class Movie: MediaItem {
    var director:String
    init(name:String, director:String){
        self.director = director
        super.init(name: name)
    }
}
class Song: MediaItem {
    var artist:String
    init(name:String, artist:String){
        self.artist = artist
        super.init(name: name)
    }
}
class Other:MediaItem {
    
}
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley"),
//    Other(name:"adb")
]
//library is MediaItem
var movieCount = 0, songCount = 0
for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}
for item in library {
    if let movie = item as? Movie {
//        print("Movie:\(item.name), dr.\(item.director)")
        print("Movie:\(movie.name), dr.\(movie.director)")
    } else if let song = item as? Song {
        print("Song:\(song.name), by \(song.artist)")
    }
}

//Any
let someObjects: [AnyObject] = [
    Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones"),
    Movie(name: "Alien", director: "Ridley Scott")
]
for item in someObjects {
    let movie = item as! Movie
}
for movie in someObjects as! [Movie] {
    
}

var a = [2]
a.append(1)
//a.append(1.2)
var b = [Any]()
b.append(1)
b.append(2.2)
b.append(Movie(name: "Casablanca", director: "Michael Curtiz"))

var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
var tuples = (3.0, 5.0)
things.append(tuples)
//things.append((3.0, 5.0))
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
    case let someDouble as Double where someDouble > 0 :
        print("a positive double value of \(someDouble)")
    case is Double:
        print("Double")
    case let someString as String:
        print("a string value of \(someString))")
    case let (x, y) as (Double, Double):
        print("")
    default:
        print("")
    }
}

