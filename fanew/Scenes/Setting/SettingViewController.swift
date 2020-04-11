import Firebase
import UIKit

class SettingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        
        let logout = UIButton()
        logout.setTitle("ログアウト", for: .normal)
        logout.setTitleColor(.gray, for: .normal)
        logout.addTarget(self, action: #selector(pushLogout), for: .touchUpInside)
        logout.frame = CGRect(x: 0, y: 300, width: 100, height: 50)
        view.addSubview(logout)
    }
    
    @objc func pushLogout(sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            UserDefaults.standard.removeObject(forKey: "email")
            UserDefaults.standard.removeObject(forKey: "name")
            let window = UIApplication.shared.keyWindow
            let viewController = WelcomeViewController()
            let navigationController = UINavigationController(rootViewController: viewController)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}
