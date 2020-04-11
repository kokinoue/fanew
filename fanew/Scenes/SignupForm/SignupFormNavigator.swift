import UIKit

protocol SignupFormNavigator {
    func toArticles()
}

final class DefaultSignupFormNavigator: SignupFormNavigator {
    private var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toArticles() {
        print("to Articles")
    }
}
