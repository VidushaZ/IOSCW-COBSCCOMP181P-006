//  Created by Vidusha  on 9/18/20.
//  Copyright © 2020 Vidusha . All rights reserved.
//


import UIKit
import Firebase

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var FirstName: UITextField!
    
    @IBOutlet weak var LastName: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var Role: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    
    @IBAction func SignUp(_ sender: UIButton) {
        
        if let email = Email.text, let password = Password.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
             
                if let e = error {
                    print(e)
                }
                else{

                    print("Success")
                }
            }
        }
    }
    

}
