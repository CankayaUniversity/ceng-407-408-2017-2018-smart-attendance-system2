//
//  checkViewController.swift
//  cagdas
//
//  Created by Berkay Çınar on 18.04.2018.
//  Copyright © 2018 Berkay Çınar. All rights reserved.
//

import UIKit
import Firebase

class checkViewController: UIViewController {

    @IBOutlet weak var quateLabel: UILabel!
    
    var docReff: DocumentReference!
 
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var surnameLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!


    @IBAction func toRead(_ sender: Any){
        
        docReff.getDocument { (docSnapshot, Error) in

              print("asd")
            guard let docSnapshot = docSnapshot, docSnapshot.exists else {return}
            let myData = docSnapshot.data()
            let id = myData!["Date"] as? String?
            //let date = myData!["Date"]
            //let date = NSDate(timeIntervalSince1970: Double(truncating: myData!["Date"] as! NSNumber)/1000);
            
           // print(date)
            let name = myData!["Course"] as! String?
            //let surname = myData!["surname"] as! String?
            self.idLbl.text = "\(id! ?? "null")"
            
            self.nameLbl.text = "\(name!)"
            
            //self.surnameLbl.text = "\(surname!)"
        }
    }
        override func viewDidLoad(){
        
        super.viewDidLoad()
        
        let db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        print(Auth.auth().currentUser?.email! ?? "null")
        var userMail = String()
        userMail = String(Auth.auth().currentUser?.email! ?? "null")
        print(userMail)
       // print(Auth.auth().currentUser!.email!)
        
          docReff = db.collection("Students").document(userMail)
          
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
