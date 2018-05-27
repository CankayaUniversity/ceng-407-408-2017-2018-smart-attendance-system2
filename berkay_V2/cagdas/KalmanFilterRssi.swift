//
//  KalmanFilterRssi.swift
//  berkay
//
//  Created by Berkay Çınar on 21.04.2018.
//  Copyright © 2018 Berkay Çınar. All rights reserved.
//

import Foundation

class KalmanFilterRssi {
    var R, Q, A, B, C, x, cov: Float?
    
    init() {
        self.R = 0.1
        self.Q = 5
        self.A = 1
        self.B = 0
        self.C = 1
        self.x = 100
    }
    
    func process(rssi: Float) -> Float? {
        let u = 0
        if self.x == 100 {
            self.x = ( 1 / self.C!) * Float(rssi)
            self.cov = ( 1 / self.C!) * self.Q! * (1 / self.C!)
        }
        else {
            // compute
            let predX = (self.A! * self.x!) + (self.B! * Float(u))
            let predCov = ((self.A! * self.cov!) * self.A! ) + self.R!
            
            //Kalman gain
            let K = predCov * self.C! * (1 / ((self.C! * predCov * self.C!) + self.Q!))
            self.x = (predX + K * (Float(rssi) - (self.C! * predX)))
            self.cov = predCov - (K * self.C! * predCov)
        }
        return self.x
    }
    
}

