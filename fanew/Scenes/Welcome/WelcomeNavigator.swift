import UIKit

protocol WelcomeNavigator {
    func toSignupForm()
    func toSigninForm()
}

final class DefaultWelcomeNavigator: WelcomeNavigator {
    private var navigationController: UINavigationController?
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func toSignupForm() {
//        let navigator = DefaultSignupFormNavigator(navigationController: UINavigationController())
//        let viewController = SignupFormViewController(navigator: navigator)
        let viewController = ArticleViewController()
//      navigationControllerがnilだから動かない
//      initの時点では代入できている
//      weakを消したらnilではなくなったが遷移しない
        navigationController?.pushViewController(viewController, animated: false)
//        navigationController?.present(viewController, animated: true, completion: nil)
    }
    
    func toSigninForm() {
        let viewController = SigninFormViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
