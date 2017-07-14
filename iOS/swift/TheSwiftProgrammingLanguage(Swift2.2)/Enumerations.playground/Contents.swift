

enum CompassPoint {
    case North
    case South
    case East
    case West
}

enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

var direction = CompassPoint.East

direction = .South

switch direction {
case .North:
    print(" north")
case .South:
    print(" south")
case .East:
    print(" east")
case .West:
    print(" west")
}

enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)

//productBarcode = .QRCode("ABVSAFDFA")

switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check)")
case .QRCode(let s):
    print("QRCode: \(s)")
}

enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

enum Planet2:Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
Planet2.Earth.rawValue

enum CompassPoint2:String {
    case North, South, East, West
}
CompassPoint2.North.rawValue

let possiblePlanet = Planet2(rawValue: 6)
possiblePlanet?.rawValue

let positionToFind = 9
if let somePlanet = Planet2(rawValue: positionToFind) {
    switch somePlanet {
    case .Earth:
        print("地球安全")
    default:
        print("这个星球不适合人类居住")
    }
} else {
    print("不是一个星球")
}


