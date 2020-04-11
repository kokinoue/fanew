import Firebase
import UIKit

class SigninFormViewController: UIViewController {
    
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
        self.mailField = UITextField()
        mailField.placeholder = "メールアドレスを入力してください"
        mailField.textColor = UIColor.black
        mailField.backgroundColor = .white
        mailField.layer.borderWidth = 1
        mailField.layer.cornerRadius = 5.0
        mailField.autocapitalizationType = .none
        mailField.keyboardType = .emailAddress
        
        self.passwordField = UITextField()
        passwordField.placeholder = "パスワードを入力してください"
        passwordField.textColor = UIColor.black
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
    
    private var formStackView: UIStackView {
        let stackView = UIStackView(arrangedSubviews: [mailField, passwordField, signupButton])
        stackView.frame = CGRect(x: 0, y: 300, width: self.view.frame.width, height: self.view.frame.height / 4)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 3
        return stackView
    }
    
    private var signupButton: UIButton {
        let button = UIButton()
        button.setTitle("ログイン", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(pushSigninButton), for: .touchUpInside)
        return button
    }
    
    @objc func pushSigninButton(sender: UIButton) {
        let email = mailField.text ?? ""
        let password = passwordField.text ?? ""
        Auth.auth().signIn(withEmail: email, password: password) {
            result, error in
            if let user = result?.user {
                // ここでモデルに値を代入するのが良さそう
                print(user)
                print("ログイン完了")
                UserDefaults.standard.set(user.email, forKey: "email")
                UserDefaults.standard.set(user.displayName, forKey: "name")
                // ここでnavigationから外してtabbarをセットしたい
                let window = UIApplication.shared.keyWindow
                window?.rootViewController = TabBarController()
                window?.makeKeyAndVisible()
                return
            }
            print("ログイン失敗")
        }
    }
    
    //    private var mailField: UITextField {
    //        let mailField = UITextField()
    //        mailField.frame = CGRect(x: 10, y: 100, width: self.view.frame.width, height: 38)
    //        mailField.placeholder = "メールアドレスを入力してください"
    //        mailField.textColor = UIColor.black
    //        mailField.backgroundColor = .white
    //        mailField.layer.borderWidth = 1
    //        mailField.layer.cornerRadius = 5.0
    //        return mailField
    //    }
    //
    //    private var passwordField: UITextField {
    //        let passwordField = UITextField()
    //        passwordField.placeholder = "パスワードを入力してください"
    //        passwordField.textColor = UIColor.black
    //        passwordField.backgroundColor = .white
    //        passwordField.layer.borderWidth = 1
    //        passwordField.layer.cornerRadius = 5.0
    //        return passwordField
    //    }
}
