import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
        
//        最初に自分で書いたやつ
//        let navigationController = UINavigationController()
//        let navigator = DefaultWelcomeNavigator(navigationController: navigationController)
//        window?.rootViewController = WelcomeViewController(navigator: navigator)
        
//        signupへ飛ばすやつ
//        let navigator = DefaultSignupFormNavigator(navigationController: navigationController)
//        window?.rootViewController = SignupFormViewController(navigator: navigator)
        
//        テラテイルのを参考に
//        これだとヒエラルキーでWelcomeViewControllerの下にUINavigationControllerが来る
//        let navigator = DefaultWelcomeNavigator(navigationController: UINavigationController())
        if let email = UserDefaults.standard.object(forKey: "email") {
            window?.rootViewController = TabBarController()
        } else {
            let viewController = WelcomeViewController()
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.setNavigationBarHidden(true, animated: false)
            window?.rootViewController = navigationController
        }
        window?.makeKeyAndVisible()
        return true
    }
}

