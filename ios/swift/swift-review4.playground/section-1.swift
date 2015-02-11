//collection types
var shoppingList: [String] = ["Eggs", "Milk"]
shoppingList.append("beg")
shoppingList += ["Baking Powder"]
shoppingList.count
shoppingList[1...3] = ["sa","bs"]
shoppingList.insert("Maple Syrup", atIndex: 0)

shoppingList[1]

for (index, value) in enumerate(shoppingList){
    println("Item \(index + 1): \(value)")
}

var someInts = [Int]()

someInts.count

var threeDoubles = [Double](count:3,repeatedValue:0.0)

var anotherThreeDoubles = Array(count:3,repeatedValue:2.5 )


