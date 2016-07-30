class Person {
    var name:String
    init(name:String){
        self.name = name
        print("\(name) 被初始化")
    }
    deinit{
        print("\(name) 被销毁")
    }
}
var r1:Person?
var r2:Person?
var r3:Person?
r1 = Person(name:"Andy Ron")
r2 = r1
r3 = r1
r2 = nil
r3 = nil
r1 = nil


class Person2 {
    let name:String
    init(name:String){ self.name = name }
    var apartment:Apartment?
    deinit{
        print("\(name) 被销毁")
    }
}
class Apartment {
    let number:Int
    init(number:Int){ self.number = number }
    var tenant:Person2?
    deinit{
        print("Apartment#\(number) 被销毁")
    }
}

var andy:Person2?
var number73:Apartment?
andy = Person2(name: "andy")
number73 = Apartment(number: 73)
andy!.apartment = number73
number73!.tenant = andy

//andy = nil

class Person3 {
    let name:String
    init(name:String){ self.name = name }
    var apartment:Apartment?
    deinit{
        print("\(name) 被销毁")
    }
}
class Apartment3 {
    let number:Int
    init(number:Int){ self.number = number }
    weak var tenant:Person2?
    deinit{
        print("Apartment#\(number) 被销毁")
    }
}
var john:Person3?
var number72:Apartment?
john = Person3(name: "john")
number72 = Apartment(number: 72)
john = nil



