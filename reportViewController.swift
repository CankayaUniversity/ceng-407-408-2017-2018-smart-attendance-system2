//
//  reportViewController.swift
//  berkay
//
//  Created by Berkay Çınar on 5.05.2018.
//  Copyright © 2018 Berkay Çınar. All rights reserved.
//

import UIKit
import Firebase
class reportViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var docRef: DocumentReference!
    var count = 0
    var contentCell = ["29.04.2018 No", "3.5.2018 No", "5.5.2018 No","7.5.2018 No"]
    var refresher: UIRefreshControl!

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return contentCell.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = contentCell[indexPath.row]
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        var userMail = String()
        userMail = String(Auth.auth().currentUser?.email! ?? "null")
        docRef = db.collection("CheckIn").document("408").collection("29.4.2018").document(userMail)
        docRef.getDocument { (docSnapshot, Error) in
            guard let docSnapshot = docSnapshot, docSnapshot.exists else {print("RETURNED 1"); return}
            let myData = docSnapshot.data()
           // var userCheckIn = String()
           // userCheckIn = myData!["Attendence"] as! String
            self.count += 1
            print("ATTENDENCE TRUE")
            self.contentCell[0] = "29.04.2018 Yes"
            self.refresh()
        }
        docRef = db.collection("CheckIn").document("408").collection("3.5.2018").document(userMail)
        docRef.getDocument { (docSnapshot, Error) in
            guard let docSnapshot = docSnapshot, docSnapshot.exists else {print("RETURNED 2"); return}
            let myData = docSnapshot.data()
           // var userCheckIn = String()
           // userCheckIn = myData!["Attendence"] as! String
            self.count += 1
            print("ATTENDENCE TRUE")
            self.contentCell[1] = "3.5.2018 Yes"
            self.refresh()
        }
        docRef = db.collection("CheckIn").document("408").collection("5.5.2018").document(userMail)
        docRef.getDocument { (docSnapshot, Error) in
            guard let docSnapshot = docSnapshot, docSnapshot.exists else {print("RETURNED 3"); return}
            let myData = docSnapshot.data()
           //var userCheckIn = String()
            //userCheckIn = myData!["Attendence"] as! String
            self.count += 1
            print("ATTENDENCE TRUE")
            self.contentCell[2] = "5.5.2018 Yes"
            self.refresh()
        }
        docRef = db.collection("CheckIn").document("408").collection("7.5.2018").document(userMail)
        docRef.getDocument { (docSnapshot, Error) in
            guard let docSnapshot = docSnapshot, docSnapshot.exists else {print("RETURNED 4"); return}
            let myData = docSnapshot.data()
           // var userCheckIn = String()
          //  userCheckIn = myData!["Attendence"] as! String
            self.count += 1
            print("ATTENDENCE TRUE")
            self.contentCell[3] = "7.5.2018 Yes"
            self.refresh()
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func Home(_ sender: Any) {
        self.performSegue(withIdentifier: "Home", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet var tableView: UITableView!
    
    func refresh(){
        print("refreshed")
        self.tableView.reloadData()
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
