import Firebase
import UIKit

class SignupFormViewController: UIViewController {
//    let navigator: SignupFormNavigator
    
//    init(navigator: SignupFormNavigator) {
//        self.navigator = navigator
//        super.init(nibName: nil, bundle: nil)
//    }
    
    var nameField: UITextField!
    var mailField: UITextField!
    var passwordField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField = UITextField()
        nameField.placeholder = "名前を入力してください"
        nameField.textColor = UIColor.black
        nameField.backgroundColor = .white
        nameField.layer.borderWidth = 1
        nameField.layer.cornerRadius = 5.0
        nameField.autocapitalizationType = .none
        
        self.mailField = UITextField()
        mailField.placeholder = "メールアドレスを入力してください"
        mailField.textColor = .black
        mailField.backgroundColor = .white
        mailField.layer.borderWidth = 1
        mailField.layer.cornerRadius = 5.0
        mailField.autocapitalizationType = .none
        mailField.keyboardType = .emailAddress
        
        self.passwordField = UITextField()
        passwordField.placeholder = "パスワードを入力してください"
        passwordField.textColor = .black
        passwordField.backgroundColor = .white
        passwordField.layer.borderWidth = 1
        passwordField.layer.cornerRadius = 5.0
        passwordField.autocapitalizationType = .none
        
        view.backgroundColor = .white
        view.addSubview(formStackView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    var formStackView: UIStackView {
        let stackView = UIStackView(arrangedSubviews: [nameField, mailField, passwordField, signupButton])
        stackView.frame = CGRect(x: 0, y: 300, width: self.view.frame.width, height: self.view.frame.height / 4)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 3
        return stackView
    }
    
    var signupButton: UIButton {
        let button = UIButton()
        button.setTitle("登録", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(pushSignupButton), for: .touchUpInside)
        return button
    }
    
    @objc func pushSignupButton(sender: UIButton) {
        print("登録完了")
        let name = nameField.text ?? ""
        let email = mailField.text ?? ""
        let password = passwordField.text ?? ""
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let user = result?.user {
                let request = user.createProfileChangeRequest()
                request.displayName = name
                request.commitChanges() { error in
                    if error == nil {
                        print("データ送信成功")
                        UserDefaults.standard.set(user.email, forKey: "email")
                        UserDefaults.standard.set(user.displayName, forKey: "name")
                        let window = UIApplication.shared.keyWindow
                        window?.rootViewController = TabBarController()
                        window?.makeKeyAndVisible()
                        return
                    }
                    print(error as Any)
                }
            }
            print(error as Any)
        }
    }
    
// 下記だとフォームの値取得できない
    
//    var nameField: UITextField {
//        let nameField = UITextField()
//        nameField.placeholder = "名前を入力してください"
//        nameField.textColor = UIColor.black
//        nameField.backgroundColor = .white
//        nameField.layer.borderWidth = 1
//        nameField.layer.cornerRadius = 5.0
//        return nameField
//    }
    
//    var mailField: UITextField {
//        let mailField = UITextField()
//        mailField.placeholder = "メールアドレスを入力してください"
//        mailField.textColor = .black
//        mailField.backgroundColor = .white
//        mailField.layer.borderWidth = 1
//        mailField.layer.cornerRadius = 5.0
//        return mailField
//    }
//
//    var passwordField: UITextField {
//        let passwordField = UITextField()
//        passwordField.placeholder = "パスワードを入力してください"
//        passwordField.textColor = .black
//        passwordField.backgroundColor = .white
//        passwordField.layer.borderWidth = 1
//        passwordField.layer.cornerRadius = 5.0
//        return passwordField
//    }
}
