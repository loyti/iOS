//
//  GameViewController.swift
//  cmHack
//
//  Created by Brice Prather on 9/7/17.
//  Copyright © 2017 Life On Your Terms, Inc. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

//import CoreMotion

class GameViewController: UIViewController {

//    var motionManager: CMMotionManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let view = self.view as! SKView? {
//            // Load the SKScene from 'GameScene.sks'
//            if let scene = SKScene(fileNamed: "GameScene") {
//                // Set the scale mode to scale to fit the window
//                scene.scaleMode = .aspectFill
//                
//                // Present the scene
//                view.presentScene(scene)
//            }
//            
//            view.ignoresSiblingOrder = true
//            
//            view.showsFPS = true
//            view.showsNodeCount = true
//        }
        
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        // Create and configure the scene.
        let scene = GameScene(size: skView.frame.size)
        scene.scaleMode = .aspectFill
        scene.size = skView.bounds.size
        
        skView.presentScene(scene)
        
        
//        motionManager = CMMotionManager()
//        if let manager = motionManager {
//            print("Motion manager is active")
//            if manager.isDeviceMotionAvailable == true {
//                print("motion detected")
//                let q = OperationQueue()
//                manager.deviceMotionUpdateInterval = 2
//                manager.startDeviceMotionUpdates(to: q) {
//                    (data: CMDeviceMotion?, error: Error?) in
//                    if let mydata = data {
//                        print("mydata", mydata.attitude)
//                        print("pitch", mydata.attitude.pitch)
//                        print("roll", mydata.attitude.roll)
//                        print("yaw", mydata.attitude.yaw)
//                    }
//                }
//                
//            } else {
//                print("probably in simulator")
//            }
//        } else {
//            print("NO Motion Manager Found")
//        }
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
