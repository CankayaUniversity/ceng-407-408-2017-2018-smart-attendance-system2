//
//  RealHomeViewController.swift
//  berkay
//
//  Created by Berkay Çınar on 3.05.2018.
//  Copyright © 2018 Berkay Çınar. All rights reserved.
//

import UIKit
import Firebase

class RealHomeViewController: UIViewController {

    @IBOutlet weak var toImg: UIImageView!
    @IBAction func toReport(_ sender: Any) {
    }
    @IBAction func toCheck(_ sender: Any) {
    }
    @IBOutlet weak var welLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var userMail = String()
        userMail = String(Auth.auth().currentUser?.email! ?? "null")
        welLbl.text = "Welcome \(userMail)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
