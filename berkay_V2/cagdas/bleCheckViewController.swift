//
//  bleCheckViewController.swift
//  cagdas
//
//  Created by Berkay Çınar on 19.04.2018.
//  Copyright © 2018 Berkay Çınar. All rights reserved.
//

import UIKit
import CoreBluetooth


class bleCheckViewController: UIViewController,CBCentralManagerDelegate,CBPeripheralDelegate
    
{
    var manager:CBCentralManager!
    var peripheral:CBPeripheral!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //manager = CBCentralManager(delegate: self, queue: nil) // burayı buttona koysan
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var periphalNameLabel: UILabel!
    @IBOutlet weak var checkInLabel: UILabel!
    @IBOutlet weak var signalLabel: UILabel!
    @IBAction func toCheck(_ sender: Any) {
        self.performSegue(withIdentifier: "toHomme" , sender: self)
    }
    
    @IBAction func checkInButton(_ sender: Any) {
        manager = CBCentralManager(delegate: self, queue: nil) // burayı buttona koysa
    }
    @IBAction func studentButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toHommme" , sender: self)
    }
    @IBOutlet weak var uuidLabel: UILabel!
    
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
        print(peripheral.name!)
        print(peripheral.identifier.uuidString)
        print("Signal power : \(RSSI)")
        if let x = RSSI as? NSNumber{
            signalLabel.text = "Signal Power : \(x)"
        }
        uuidLabel.text = "UUID : \(peripheral.identifier.uuidString)"
        
        periphalNameLabel.text="\(String(describing: peripheral.name))"
        
        if peripheral.name == "asensor_FF5E" {
            manager.connect(peripheral, options: nil)
            print("bagladi pasam")
            checkInLabel.text="Get It !!!"
            central.stopScan()
            
            // buraya işlemler yapılacak
            
            // manager.cancelPeripheralConnection(peripheral)
            
            //bekleme süresi atılacak
            
            //  manager.scanForPeripherals(withServices: nil, options: nil)
        }
    }
}
