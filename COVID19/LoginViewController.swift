
//  Created by Vidusha  on 9/18/20.
//  Copyright © 2020 Vidusha . All rights reserved.
//
//


import UIKit
import Firebase

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func SignInBtn(_ sender: UIButton) {
        if let email = email.text, let password = password.text {
            
            Auth.auth().signIn(withEmail: email, password: password) {

                authResult, error in
                
            
                if let e = error {
                    print(e)
                
            }
                else {

                    print("login success")
                    
                            }
            }
        }
    }
    

}
