
enum VendingMachineError:ErrorType {
    case InvalidSelection
    case InsufficientFunds(required: Double)
    case OutOfStock
}

struct Item{
    var price:Double
    var count:Int
}
var inventory = [
    "Candy Bar" : Item(price: 1.25, count: 7),
    "Chips" : Item(price: 1.00, count: 4),
    "Pretzels" : Item(price: 075, count: 11)
]

var amountDeposited = 1.00
func vend(itemNamed name:String)throws{
    guard let item = inventory[name] else {
        throw VendingMachineError.InvalidSelection
    }
    guard item.count > 0 else {
        throw VendingMachineError.OutOfStock
    }
    
    if amountDeposited >= item.price {
        amountDeposited -= item.price
        -item.count
        inventory[name] = item
    } else {
        let amountRequired = item.price - amountDeposited
        throw VendingMachineError.InsufficientFunds(required: amountRequired)
    }
}

//try vend(itemNamed: "adf")

let favoriteSnacks = [
    "Alice":"Chips",
    "Bob":"Licorice",
    "Eve":"Pretzels"
]
func buyFavoriteSnacks(person:String)throws{
    let snackNmae = favoriteSnacks[person] ?? "Candy Bar"
    try vend(itemNamed: snackNmae)
}
do {
    try vend(itemNamed: "Eve")
} catch VendingMachineError.InvalidSelection {
    print("invalid select")
}
//try! vend(itemNamed: "Eve")

//func processFile(filename:String)throws{
//    if exists(filename) {
//        let file = open(filename)
//        defer {
//            close(filename)
//        }
//        
//    }
//}

