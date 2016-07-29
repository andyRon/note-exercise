class Test {
    deinit{
        print("deinit")
    }
}
var t = Test()


struct Bank {
    static var coinsInBank = 10_000
    static func vendCoins( numberOfCoinsToVend:Int) -> Int{
        var varnumberOfCoinsToVend:Int = numberOfCoinsToVend
        varnumberOfCoinsToVend = min(coinsInBank, varnumberOfCoinsToVend)
        coinsInBank -= varnumberOfCoinsToVend
        return varnumberOfCoinsToVend
    }
    static func recieveCoins(coins:Int){
        coinsInBank += coins
    }
}
class Player {
    var coinsInPurse:Int
    init(coins:Int){
        coinsInPurse = Bank.vendCoins(coins)
    }
    func winCoins(coins:Int){
        coinsInPurse += Bank.vendCoins(coins)
    }
    deinit{
        Bank.recieveCoins(coinsInPurse)
    }
}

var p:Player? = Player(coins: 10)
p!.coinsInPurse
p!.winCoins(12)
p!.coinsInPurse
Bank.coinsInBank
p = nil
Bank.coinsInBank

