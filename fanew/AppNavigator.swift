import UIKit

protocol AppNavigator {
    func toWelcome()
}

class DefaultAppNavigator: AppNavigator {
    var window: UIWindow?
    init(window: UIWindow?) {
        self.window = window
    }
    
//    private var rootViewController: WelcomeViewController {
//        return window?.rootViewController as? WelcomeViewController
//    }
    
    func toWelcome() {
        
    }
}

