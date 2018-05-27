//
//  ViewController.swift
//  cagdas
//
//  Created by Berkay Çınar on 13.04.2018.
//  Copyright © 2018 Berkay Çınar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI


class ViewController: UIViewController, FUIAuthDelegate {

    var auth:Auth?
    
    var authUI: FUIAuth?
    
    var authStateListenerHandle: AuthStateDidChangeListenerHandle?
    
    
    @IBAction func loginAction(sender: AnyObject) {
        
        let authViewController = authUI?.authViewController()
        
        self.present(authViewController!, animated:true , completion: nil)
        
    }

    @IBAction func toWel(_ sender: Any) {
        self.performSegue(withIdentifier: "toWelcome", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.auth = Auth.auth()
        
        self.authUI = FUIAuth.defaultAuthUI()
        
        self.authUI?.delegate = self
        
        self.authUI?.providers = []
        
        //try.self.authUI!.signOut()
        
        do {
            
            try authUI!.signOut()
            
        } catch {
            
            return
            
        }
        
        self.authStateListenerHandle = self.auth?.addStateDidChangeListener { (auth, user) in
            
            guard user != nil else {
                
                self.loginAction(sender: self)
                
                return
                
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        // handle user and error as necessary
        if Auth.auth().currentUser != nil {
        var userMail = String()
        userMail = String(Auth.auth().currentUser?.email! ?? "null")
        print(Auth.auth().currentUser?.displayName)
            if userMail == "murat@mail.com" {
                self.performSegue(withIdentifier: "toTeacher", sender: self)
            }
            if userMail == "faris@mail.com"{
                self.performSegue(withIdentifier: "toTeacher", sender: self)
            }
            else{
                self.performSegue(withIdentifier: "toHome" , sender: self)
            }
        //let homeViewController = HomeViewController()
        //self.present(homeViewController, animated:true, completion: nil)
           self.performSegue(withIdentifier: "toHome" , sender: self)
        }
        
    }


}

