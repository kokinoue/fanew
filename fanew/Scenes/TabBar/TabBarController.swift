import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let articleViewController = ArticleViewController()
        articleViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        let settingViewController = SettingViewController()
        settingViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 2)
        self.setViewControllers([articleViewController, settingViewController], animated: true)
    }
}
