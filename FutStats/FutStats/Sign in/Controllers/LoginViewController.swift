
import UIKit
//import FirebaseDatabase
//import FirebaseAuth

final class LoginViewController: UIViewController {
    
    //var ref: DatabaseReference!

    @IBOutlet var warnLabel: UILabel!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
//    var authStateDidChangeListenerHandle: AuthStateDidChangeListenerHandle!
//    override func loadView() {
//        super.loadView()
//        ref = Database.database().reference(withPath: "users")
//
//        // если у нас еще есть действующий user то сделаем переход
//        authStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
//            guard let _ = user else {
//                return
//            }
//            self?.performSegue(withIdentifier: "toMainFlow", sender: nil)
//        }
//
//        NotificationCenter.default.addObserver(self, selector: #selector(kbDidShow), name: UIWindow.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(kbDidHide), name: UIWindow.keyboardWillHideNotification, object: nil)
//
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        // чистим поля
//        emailTF.text = ""
//        passwordTF.text = ""
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        NotificationCenter.default.removeObserver(self)
//        Auth.auth().removeStateDidChangeListener(authStateDidChangeListenerHandle)
//    }
//    
//    @IBAction func signInAction() {
//        // проверяем все поля
//        guard let email = emailTF.text,
//              let password = passwordTF.text,
//              email != "",
//              password != "" else {
//            // показываем уникальный error
//            displayWarningLabel(withText: "Info is incorrect")
//            return
//        }
//
//        // логинемся
//        
//        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
//            if let error {
//                self?.displayWarningLabel(withText: "Error ocured: \(error.localizedDescription)")
//            } else if let _ = user {
//                // переходим на новый экран
//                self?.performSegue(withIdentifier: "toMainFlow", sender: nil)
//                return
//            } else {
//                self?.displayWarningLabel(withText: "No such user")
//            }
//        }
//    }
//
//    
//    @IBAction func signUpAction() {
//        // проверяем все поля
//        guard let email = emailTF.text, let password = passwordTF.text, email != "", password != "" else {
//            displayWarningLabel(withText: "Info is incorrect")
//            return
//        }
//        
//        // createUser
//        Auth.auth().createUser(withEmail: email, password: password) { [weak self] user, error in
//            if let error = error {
//                self?.displayWarningLabel(withText: "Registration was incorrect\n\(error.localizedDescription)")
//            } else {
//                guard let user = user else {
//                    return
//                }
//                let userRef = self?.ref.child(user.user.uid)
//                userRef?.setValue(["email": user.user.email])
//            }
//        }
//    }
//    
//    // MARK: Private
//
//     private func displayWarningLabel(withText text: String)
//    {
//        warnLabel.text = text
//        UIView.animate(withDuration: 3,
//                       delay: 0,
//                       usingSpringWithDamping: 1,
//                       initialSpringVelocity: 1,
//                       options: .curveEaseInOut, // плавно появляется и плавно исчезает
//                       animations: { [weak self] in
//                           self?.warnLabel.alpha = 1
//                       }) { [weak self] _ in
//            self?.warnLabel.alpha = 0
//        }
//    }
//    
//    @objc func kbDidShow(notification: Notification) {
//        self.view.frame.origin.y = 0
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            self.view.frame.origin.y -= (keyboardSize.height / 2)
//        }
//    }
//    
//    @objc func kbDidHide() {
//        self.view.frame.origin.y = 0
//    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

