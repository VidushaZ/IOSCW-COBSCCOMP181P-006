
//  Created by Vidusha  on 9/18/20.
//  Copyright © 2020 Vidusha . All rights reserved.
//
//


import UIKit
import Firebase
import LocalAuthentication
class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func FaceId(_ sender: Any) {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [weak self] success, authenticationError in
                
                DispatchQueue.main.async {
                    if success {
                        let ac = UIAlertController(title: "Authentication success", message: "Well Done", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "Happy", style: .default))
                        self?.present(ac, animated: true)
                    } else {
                        let ac = UIAlertController(title: "Authentication failed", message: "You could not be verified; please try again.", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        self?.present(ac, animated: true)
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Biometry unavailable", message: "Your device is not configured for biometric authentication.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
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
