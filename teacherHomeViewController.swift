//
//  teacherHomeViewController.swift
//  berkay
//
//  Created by Berkay Çınar on 5.05.2018.
//  Copyright © 2018 Berkay Çınar. All rights reserved.
//

import UIKit
import Firebase

class teacherHomeViewController: UIViewController {

    @IBAction func listButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toList", sender: self)
    }
    @IBOutlet weak var toWelLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var userMail = String()
        userMail = String(Auth.auth().currentUser?.email! ?? "null")
        toWelLbl.text = "Welcome \(userMail)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
