//
//  ViewController.swift
//  Broomstick
//
//  Created by Abby on 7/7/16.
//  Copyright © 2016 AbbyEF109. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var broomstickView: UIView!
    
    var manager: CMMotionManager!
    
    override func viewDidLoad() {
        self.manager = CMMotionManager()
        self.manager.gyroUpdateInterval = 0.2
        
        manager.startGyroUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (gyroData, NSError) -> Void in
            print(gyroData?.rotationRate)
            //self.outputRotationData(gyroData!.rotationRate)
        })

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
}