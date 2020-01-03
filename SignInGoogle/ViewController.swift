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

class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {

    var nextViewController: NextViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = "899781186525-8ijhjj2ahr5b4sf5i0akoe44p51kn0u0.apps.googleusercontent.com"
        
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.login")
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.me")
        
        GIDSignIn.sharedInstance().signInSilently()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func perform(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "nextVC" {
            nextViewController = segue.destination as! NextViewController
        }
    }
   
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error)
        } else {
            performSegue(withIdentifier: "nextVC", sender: self)
        }
    }

    func sign(signIn: GIDSignIn!, didDisconnectWithUser user: GIDGoogleUser!, withError error: NSError!) {
        if let error = error {
            print(error)
        }

        nextViewController.dismiss(animated: true, completion: nil)

    }
    
}
