class Vehicle {
    var currentSpeed = 0.0
    var description:String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise(){
        
    }
}
let someVehicle = Vehicle()
someVehicle.description

class Bicycle:Vehicle {
    var hasBasket = false
}
let someBicycle = Bicycle()
someBicycle.currentSpeed = 20
someBicycle.description

class Tandem:Bicycle{
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 12
tandem.description

class Train:Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
    override var description: String {
        return super.description + " son"
    }
}
class Car:Vehicle{
    var gear = 1
    override var description: String{
        return super.description + " in gear \(gear)"
    }
}
class AutomaticCar: Car {
    override var currentSpeed: Double{
        didSet{
            gear = Int(currentSpeed/10.0) + 1
        }
    }
}

class Car2 {
    final var color:String = "black"
    final func move(qianjin:Bool, juli:Double){
        
    }
    final class func turn(){
        
    }
}
