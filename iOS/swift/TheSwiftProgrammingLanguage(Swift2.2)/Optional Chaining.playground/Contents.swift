class Person {
    var residence:Residence?
}
class Residence {
    var numberOfRooms = 1
}
var person = Person()
//person.residence = Residence()
var val = person.residence?.numberOfRooms
val?.description


class Person2 {
    var residence:Residence2?
}
class Residence2{
    var rooms = [Room]()
    var numberOfRooms:Int{
        return rooms.count
    }
    subscript(i:Int) -> Room{
        get{
            return rooms[i]
        }
        set{
            rooms[i] = newValue
        }
    }
    func printNumberRooms(){
        print("房间的总数为\(numberOfRooms)")
    }
    var address:Address?
}

class Room {
    let name:String
    init(name:String){ self.name = name }
}
class Address {
    var buildingName:String?
    var buildingNumber:String?
    var street:String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil {
            return buildingNumber
        } else {
            return nil
        }
        
    }
}