//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Carmelo Hernandez on 3/5/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
            let password = passwordField.text!
            PFUser.logInWithUsername(inBackground: username, password:password) {(user, error) in
                if user != nil {
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                    print(error as Any)
                }
            }
        
    }
    @IBAction func onSignup(_ sender: Any) {
        let user = PFUser()
            user.username = usernameField.text
            user.password = passwordField.text
            user.signUpInBackground { (succeeded, error) in
               if succeeded {
                   self.performSegue(withIdentifier: "loginSegue", sender: nil)
               } else {
                   print(error as Any)
               }
            }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
