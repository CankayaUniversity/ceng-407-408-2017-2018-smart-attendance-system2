//
//  studentViewController.swift
//  cagdas
//
//  Created by Berkay Çınar on 18.04.2018.
//  Copyright © 2018 Berkay Çınar. All rights reserved.
//

import UIKit
import Firebase

class studentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var userMail = String()
        userMail = String(Auth.auth().currentUser?.email! ?? "null")
        
        nameLabel.text = " Welcome : \(Auth.auth().currentUser?.email) + (/userMail) "
        
        

        // Do any additional setup after loading the view.
    }

    @IBAction func toRepRet(_ sender: Any) {
        self.performSegue(withIdentifier: "toRepRet", sender: self)
    }
    @IBOutlet weak var nameLabel: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    

    /*
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
     
     @IBOutlet weak var authTextField: UITextField!
     @IBOutlet weak var quateTextField: UITextField!
     @IBOutlet weak var quateLabel: UILabel!
     
     var docRef: DocumentReference!
     var docReff: DocumentReference!
     
     
     @IBAction func savedButton(_ sender: Any) {
     
     guard let quateText = quateTextField.text, !quateText.isEmpty else { return }  // , !quateTextField.isEnabled else { return }
     
     guard let quateAuth = authTextField.text, !quateAuth.isEmpty else { return }  // , !quateTextField.isEnabled else { return }
     
     let dataToSave: [String: Any] = ["quaote": quateText, "author": quateAuth]
     
     docReff.setData(dataToSave){ Error in
     if Error != nil {
     print("oh no! Got en error:  \(Error?.localizedDescription)")
     }
     else {
     print("Data been Saved")
     }
     }
     }
     
     @IBOutlet weak var nameLbl: UILabel!
     @IBOutlet weak var surnameLbl: UILabel!
     @IBOutlet weak var idLbl: UILabel!
     
     
     @IBAction func toRead(_ sender: Any){
     docRef.getDocument { (docSnapshot, Error) in
     print("asd")
     guard let docSnapshot = docSnapshot, docSnapshot.exists else {return}
     let myData = docSnapshot.data()
     let id = myData!["id"] as! String?
     let name = myData!["name"] as! String?
     let surname = myData!["surname"] as! String?
     
     self.idLbl.text = "\(id!)"
     
     self.nameLbl.text = "\(name!)"
     
     self.surnameLbl.text = "\(surname!)"
     }
     }
     override func viewDidLoad() {
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
     if(Auth.auth().currentUser?.email! ?? "b" == "berkay@mail.com"){
     
     docRef = db.collection("Students").document(userMail)
     
     print("berkay")
     }
     else if(Auth.auth().currentUser?.email ?? "b" == "merve@mail.com"){
     docRef = db.collection("Students").document("Student1")
     }
     docReff = Firestore.firestore().collection("Students").document(userMail)
     
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

    */

}
