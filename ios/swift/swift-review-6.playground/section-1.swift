enum CompassPoint{
    case North
    case South
    case East
    case West
}

enum Planet{
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Nepturn
}
var directionToHead = CompassPoint.West
directionToHead = .East

directionToHead = .South
switch directionToHead{
case .North:
    println("Lots of planets have a north")
case .South:
    println("Watch out for penguins")
case .East:
    println("Where the sun rises")
case .West:
    println("Where the skies are blue")
}

enum Barcode{
    case UPCA(Int, Int, Int)
    case QRCode(String)
}
var productBardcode = Barcode.UPCA(8,85909_51223, 3)

productBardcode = .QRCode("AFDAFDAFDASDFADS")

switch productBardcode{
case .UPCA(var numberSystem, let identifier, let check):
    println("")
default:
    println("df")
}
switch productBardcode{
case let .UPCA( numberSystem, identifier, check):
    println("UPC-A with value of \(numberSystem), \(identifier), \(check).")
case var .QRCode(productCode):
    println("QR code with value of \(productCode).")
}

enum ASCIIControlCharacter:Character{
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

enum Planet2: Int{
    case Mercury = 1,Venus, Earth, Mars, Jupiter, Saturn
}
Planet2.Mars.rawValue
let possiblePlanet = Planet2(rawValue: 5)
possiblePlanet?.rawValue

struct Resolution{
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
let someResolution = Resolution()
let someVideMode = VideoMode()
someResolution.width
someVideMode.resolution.height
someVideMode.resolution.height = 12

let hd = Resolution(width: 1920, height: 1080)

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

tenEighty.frameRate

if tenEighty === alsoTenEighty{
    println("ten")
}



