//
//  ViewController.swift
//  Broomstick
//
//  Created by Abby on 7/7/16.
//  Copyright © 2016 AbbyEF109. All rights reserved.
//

import UIKit
import CoreMotion

let accelerationFactor = 50.0 //Made type Double by the period

class ViewController: UIViewController {
    @IBOutlet var LoopSky2: UIImageView!
    
    var motionManager: CMMotionManager!
    
    var broomImageView =  UIImageView()
    
    override func viewDidLoad() {
        
        self.broomImageView = UIImageView(image: UIImage(named: "BroomCropped.png"))
        let rightLimit: CGFloat = super.view.frame.width - broomImageView.frame.width - 10
        let leftLimit: CGFloat = broomImageView.frame.width - 30
        
        broomImageView.frame = CGRect(x: 130, y: 400, width: 50, height: 500)
        view.addSubview(broomImageView)
        
        self.motionManager = CMMotionManager()
        self.motionManager.gyroUpdateInterval = 0.2
        self.motionManager.accelerometerUpdateInterval = 0.05
        
//        manager.startGyroUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (gyroData, NSError) -> Void in
//            self.imageView.frame.origin.x += CGFloat((gyroData?.rotationRate.x)!)
//            print(gyroData?.rotationRate)
//            //self.outputRotationData(gyroData!.rotationRate)
//        }
        
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) { (accelData, NSError) in
            // is accelData?.acceleration.x positive? or negative?
            // if it's negative (left) check if broom is not at left minit. If it's not then move to left
            // same with right (positive acceleration)
            
            
            
            
            if accelData?.acceleration.x < 0 {
                if self.broomImageView.frame.origin.x >= leftLimit { // negative
                    self.broomImageView.frame.origin.x += CGFloat(accelerationFactor * (accelData?.acceleration.x)!)
                }
            } else if self.broomImageView.frame.origin.x <= rightLimit { // positive
                self.broomImageView.frame.origin.x += CGFloat(accelerationFactor * (accelData?.acceleration.x)!)
            }
            
        }
        
        let options = UIViewAnimationOptions.Repeat
        
        UIView.animateWithDuration(5.0, delay: 0.0, options: options, animations: {
            self.LoopSky2.frame = CGRect(x: 0, y: 50, width: self.view.frame.width, height: self.view.frame.height)
            }, completion: nil)
        
    }
    
//        manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (accelData, NSError) -> Void in
//            print(accelData?.rotationRate)
//        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
}