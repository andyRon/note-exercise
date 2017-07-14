import CoreData

class FavoritesList {
    static let sharedFavoritesList = FavoritesList()
    private(set) var favorites:[String]
    
    init(){
        let defaults = NSUserDefaults.standardUserDefaults()
        let storedFavorites = defaults.objectForKey("favorites") as? [String]
        favorites = storedFavorites != nil ? storedFavorites! : []
    }
    
    func addFavorites(fontName:String){
        if !favorites.contains(fontName) {
            favorites.append(fontName)
            saveFavorites()
        }
    }
    
    func removeFavorites(fontName:String){
        if let index = favorites.indexOf(fontName) {
            favorites.removeAtIndex(index)
            saveFavorites()
        }
    }
    private func saveFavorites(){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(favorites, forKey: "favorites")
        defaults.synchronize()
    }


}

FavoritesList.sharedFavoritesList.favorites.append("g")

var f = FavoritesList.sharedFavoritesList
f.favorites
f.addFavorites("a")
f.favorites


