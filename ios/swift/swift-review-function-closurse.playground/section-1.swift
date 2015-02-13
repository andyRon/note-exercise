func swapTwoInts(inout a:Int, inout b:Int){
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 123
swapTwoInts(&someInt, &anotherInt)

println(someInt)


func addTwoInts(a: Int, b:Int) -> Int{
    return a+b
}

var mathFunction :(Int, Int) -> Int = addTwoInts

mathFunction(2,3)


func stepForward(input: Int) -> Int{
    return input + 1
}
func stepBackward(input: Int) -> Int{
    return input - 1
}
func chooseStepFunction(backwards: Bool) -> (Int)->Int{
    return backwards ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue>0)

while currentValue > 0{
    println("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
