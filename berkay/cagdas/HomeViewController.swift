//
//  homeViewController.swift
//  cagdas
//
//  Created by Berkay Çınar on 16.04.2018.
//  Copyright © 2018 Berkay Çınar. All rights reserved.
//

import UIKit
import Firebase


class homeViewController: UIViewController
{
    var docReff: DocumentReference!

    @IBOutlet weak var toImg: UIImageView!

    @IBOutlet weak var welLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var userMail = String()
        userMail = String(Auth.auth().currentUser?.email! ?? "null")
        welLbl.text = "Welcome \(userMail)"
        let db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        print(Auth.auth().currentUser?.email! ?? "null")
        print(userMail)
        // print(Auth.auth().currentUser!.email!)
        
        docReff = db.collection("Students").document(userMail)
        docReff.getDocument { (docSnapshot, Error) in
            print("asd")
            guard let docSnapshot = docSnapshot, docSnapshot.exists else {return}
            let myData = docSnapshot.data()
            var imageUrlString = String()
            imageUrlString = myData!["photoUrl"] as! String
            print(imageUrlString)
            if let url = URL(string: imageUrlString){
                do {
                    let data = try Data(contentsOf: url)
                    self.toImg.image = UIImage(data: data)
                }catch let err {
                    print("Error ")
                }
            }
        }
    }

    @IBAction func toBle(_ sender: Any) {
        self.performSegue(withIdentifier: "toHommmme", sender: self)
    }
    @IBAction func toRep(_ sender: Any){
        self.performSegue(withIdentifier: "toReport", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

