//
//  ViewController.swift
//  SignInGoogle
//
//  Created by Salma on 12/13/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit
import Google
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()

        
        var error: NSError?
        GGLContext.sharedInstance().configureWithError(&error)
        
        if error != nil {
            print(error!)
            return
        }
        
        GIDSignIn.sharedInstance()?.uiDelegate = self
        
        let signInButton = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        signInButton.center = view.center
        view.addSubview(signInButton)
    }


}

