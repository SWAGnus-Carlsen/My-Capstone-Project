
import Foundation
import Firebase

struct User {
    
    // MARK: Internal

    // идентификатор пользователя
    let uid: String
    let email: String
    
    // MARK: Lifecycle


    init(user: Firebase.User) {
        self.uid = user.uid
        self.email = user.email ?? ""
    }
}

