//
//  listViewController.swift
//  berkay
//
//  Created by Berkay Çınar on 5.05.2018.
//  Copyright © 2018 Berkay Çınar. All rights reserved.
//

import UIKit

class listViewController: UIViewController {

    @IBAction func toThome(_ sender: Any) {
        self.performSegue(withIdentifier: "toTeacherHome", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
