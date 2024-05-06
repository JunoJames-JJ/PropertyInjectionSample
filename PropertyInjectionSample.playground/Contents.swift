import UIKit

struct loggedUserIn {
    let username: String
}

class ApiClient {
    static let instance = ApiClient ()
    private init () { }
    
    func login (completion: (loggedUserIn) -> Void) {
        print ("Login button called...")
        let user = loggedUserIn(username: "ExampleUser")
        completion(user)
    }
}

class LoginViewController: UIViewController {
    //Property Injection...
    var api = ApiClient.instance
    func didTapLoginButton () {
       api.login () { user in
           print ("Logged in as \(user.username)")
        }
    }
}

let viewController = LoginViewController()
viewController.didTapLoginButton()



