import UIKit

class WelcomeViewController: UIViewController {
//    let navigator: WelcomeNavigator
//
//    init(navigator: WelcomeNavigator) {
//        self.navigator = navigator
//        super.init(nibName: nil, bundle: nil)
////        navigator.toSignupForm()
//    }
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "fanew"
        view.backgroundColor = UIColor.white
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
//        imageView.image = UIImage(named: "welcome.JPG")
//        imageView.contentMode = .scaleAspectFill
        view.addSubview(buttonStackView)
        view.addSubview(logoStackView)
//        view.addSubview(imageView)
//        view.sendSubviewToBack(imageView)
    }
    
    private lazy var logoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoImageView])
        stackView.frame = CGRect(x: 0, y: self.view.frame.height * 1 / 10, width: self.view.frame.width, height: self.view.frame.height / 2)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 3
        return stackView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [signupButton, signinButton])
        stackView.frame = CGRect(x: 0, y: self.view.frame.height * 3 / 5, width: self.view.frame.width, height: self.view.frame.height / 6)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 3
        return stackView
    }()
    
    private lazy var signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("新規登録", for: .normal)
        button.setTitleColor(UIColor(hex: "#6EC8CE"), for: .normal)
//        button.backgroundColor = .gray
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.layer.cornerRadius = 15
//        button.layer.borderColor = UIColor.gray.cgColor
//        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(pushToSignupFormButton), for: .touchUpInside)
        return button
    }()

    private lazy var signinButton: UIButton = {
        let button = UIButton()
        button.setTitle("ログイン", for: .normal)
        button.setTitleColor(UIColor(hex: "#6EC8CE"), for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(pushToSigninFormButton), for: .touchUpInside)
        return button
    }()
    
    @objc func pushToSignupFormButton(sender: UIButton){
        print("登録ボタン")
        let viewController = SignupFormViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
//        navigator.toSignupForm()
    }
    
    @objc func pushToSigninFormButton(sender: UIButton){
        print("ログインボタン")
        let viewController = SigninFormViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
//        navigator.toSigninForm()
    }
    
}
