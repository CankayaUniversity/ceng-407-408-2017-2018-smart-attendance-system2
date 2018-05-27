//
//  ble382ViewController.swift
//  berkay
//
//  Created by Berkay Çınar on 25.05.2018.
//  Copyright © 2018 Berkay Çınar. All rights reserved.
//

import UIKit
import CoreBluetooth
import Firebase

class ble382ViewController: UIViewController,CBCentralManagerDelegate,CBPeripheralDelegate  {
    
    var manager:CBCentralManager!
    
    var peripheral:CBPeripheral!
    
    var docRef: DocumentReference!
    var docReff: DocumentReference!
    var bleFound: Bool!
    
    var attendenceTaken: Bool!
    var userMail = String()
    
    @IBOutlet weak var thereBle: UILabel!
    @IBOutlet weak var checkInLabel: UILabel!
    @IBAction func toHHome(_ sender: Any) {
                self.performSegue(withIdentifier: "toHHome", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CBCentralManager(delegate: self, queue: nil)
        
        let db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        print(Auth.auth().currentUser?.email! ?? "null")
        userMail = String(Auth.auth().currentUser?.email! ?? "null")
        manager.scanForPeripherals(withServices: nil, options: nil)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == CBManagerState.poweredOn {
            checkInLabel.text="Bluetooth var"
            print("bluetooth var")
            central.scanForPeripherals(withServices: nil, options: nil)
        } else {
            checkInLabel.text="Bluetooth yok"
            
            print("Bluetooth not available.")
        }
    }
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral,
                        advertisementData: [String: Any], rssi RSSI: NSNumber) {
        if peripheral.identifier.uuidString == "E2AA86E0-C67C-8E64-5108-A555AAE1D778" {
            //manager.connect(peripheral, options: nil)
            print(peripheral.name!)
            
            print(peripheral.identifier.uuidString)
            print("Signal power : \(RSSI)")
            let stringRSSI = RSSI.stringValue
            let currentRssi = Float(stringRSSI)
            var noiseReducedRssi = RSSI.intValue
            if noiseReducedRssi > -70 {
                
            }
            else {
                print("You are not in the class")
                checkInLabel.text = "You are far away from BLE!"
                self.attendenceTaken=false
            }
            
            print("bagladi")
            checkInLabel.text="BLE FOUND!!!"
            self.bleFound = true
            if self.bleFound == true {
                checkInLabel.text = "BLE FOUND! YOU ARE DONE!!!"
                thereBle.text = " "
                let date = NSDate()
                let attendance = "true"
                let calendar = Calendar.current
                let year = calendar.component(.year, from: date as Date)
                let month = calendar.component(.month, from: date as Date)
                let day = calendar.component(.day, from: date as Date)
                let db = Firestore.firestore()
                let settings = db.settings
                settings.areTimestampsInSnapshotsEnabled = true
                db.settings = settings
                print("\(date)")
                docReff = db.collection("CheckIn").document("382").collection("\(day).\(month).\(year)").document(userMail)
                docRef = db.collection("CheckInWeb").document(userMail)
                let dataToSave = ["Student": userMail, "Attendence": attendance, "Course": "CENG382", "Date" : date] as [String : Any]
                
                if noiseReducedRssi > -70 {
                    docReff.setData(dataToSave){ Error in
                        if Error != nil {
                            print("oh no! Got en error:  \(Error?.localizedDescription)")
                        }
                        else {
                            self.docRef.setData(dataToSave){ Error in
                                if Error != nil {
                                    print("OH NO!")
                                }
                            }
                            print("Check In Data been Saved")
                            print("BLE FOUND! ATTENDENCE IS BEING TAKEN")
                            self.attendenceTaken = true
                            self.manager.stopScan()
                        }
                    }
                }
                else {
                    print("You are not in the class")
                    checkInLabel.text = "You are far away from BLE!"
                }
            }
            else {
                print("BLE NOT FOUND")
            }
            central.stopScan()
            
            manager.cancelPeripheralConnection(peripheral)
            
            print("hg")
            
            manager.scanForPeripherals(withServices: nil, options: nil)
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
}
