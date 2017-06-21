import UIKit

@UIApplicationMain
class MyAppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow? = MyWindow()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = MyViewController()
        self.window?.backgroundColor = UIColor.red
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
