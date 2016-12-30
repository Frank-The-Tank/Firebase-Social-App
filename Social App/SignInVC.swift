//
//  ViewController.swift
//  Social App
//
//  Created by Frank Garcia on 12/29/16.
//  Copyright © 2016 Malibit. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: EnhancedField!
    @IBOutlet weak var passwordField: EnhancedField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Facebook Authentication followed by Firebase Authentication

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("FRANK: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("FRANK: User cancelled Facebook authentication")
            } else {
                print("FRANK: Succesfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
            
        }
        
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("FRANK: Unable to authenticate with Firebase = \(error)")
            } else {
                print("FRANK: Succesfully authenticated with Firebase")
            }
            
        })
    }
    
    // Standard email verification with Firebase

    @IBAction func signinTapped(_ sender: Any) {
        
        if let email = emailField.text, let pwd = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("FRANK: Email user authenticated with Firebase")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("FRANK: Unable to authenticate with Firebase")
                        } else {
                            print("FRANK: New email user authenticated with Firebase")
                        }
                    })
                }
            })
        }
    }
}

