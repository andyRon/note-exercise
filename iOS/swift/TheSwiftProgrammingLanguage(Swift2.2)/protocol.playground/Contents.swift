
protocol someProtocol {
    
}

protocol otherProtocol:someProtocol {
    
}

class fatherClass {
    
}

class threeClass: fatherClass, someProtocol {
    
}

import GameKit

protocol test: GKAgentDelegate, AbsoluteValuable{
    
}

protocol someProtocol2 {
    var property :String {get set}
}

protocol  FullyNamed {
    var fullyname:String{get}
}
struct Person: FullyNamed {
    var fullyname: String
}

let john = Person(fullyname: "John xuenuo")

john.fullyname

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable{
    case Off, On
    mutating func toggle() {
        switch self{
        case Off:
            self = On
        case On:
            self = Off
        }
    }
}

var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()
lightSwitch




