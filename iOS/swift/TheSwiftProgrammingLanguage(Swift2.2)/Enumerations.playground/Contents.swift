

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



