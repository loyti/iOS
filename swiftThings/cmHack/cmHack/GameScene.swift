//
//  GameScene.swift
//  cmHack
//
//  Created by Brice Prather on 9/7/17.
//  Copyright © 2017 Life On Your Terms, Inc. All rights reserved.
//

import SpriteKit
import GameplayKit

import CoreMotion




class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
     var motionManager: CMMotionManager?
    
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    var player = SKSpriteNode(texture: SKTexture(imageNamed: "Spaceship.png"))
//    var player = SKSpriteNode()
    
    var shipSpeed: Double = 0
    var turnSpeed: Double = 0
    
    
    //create asteroids
    var possibleAsteroids = ["asteroid-small.png", "asteroid-icon.png"]
    
    let asteroidCategory:UInt32 = 0x1 << 1
    let bulletCategory:UInt32 = 0x1 << 0
    
    
    override func didMove(to view: SKView) {
        
        physicsWorld.contactDelegate = self
        
        player.position = CGPoint(x: self.size.width / 2,y: self.size.height / 5) // (x: CGFloat, y: CGFloat)
        
        var Tr = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(GameScene.spawnBullets), userInfo: nil, repeats: true)

        player.size.width = 40
        player.size.height = 40
        player.zRotation = CGFloat(0.0)
        
//        let shipPhysics = SKPhysicsBody(texture: SKTexture(imageNamed: "Spaceship.png"), size: CGSize(width: player.size.width, height: player.size.height))
        
        let shipPhysics = SKPhysicsBody(rectangleOf: CGSize(width: player.size.width, height: player.size.height))
//        shipPhysics.isDynamic = false
        shipPhysics.allowsRotation = false
        shipPhysics.affectedByGravity = false
        shipPhysics.friction = 0
        shipPhysics.restitution = 0
        shipPhysics.categoryBitMask = 0b100
//        shipPhysics.linearDamping = 0
//        shipPhysics.angularDamping = 0
        
        player.physicsBody = shipPhysics
        
        
        self.addChild(player)
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 0
        border.categoryBitMask = 0b100
        
        self.physicsBody = border
        
        
        
        
        
        // create category for them
        let asteroidCategory:UInt32 = 0x1 << 1
        
        //create Asteroid Timer
        var Atr = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(addAsteroid), userInfo: nil, repeats: true)
        
        
        
        motionManager = CMMotionManager()
        if let manager = motionManager {
            print("Motion manager is active")
            if manager.isDeviceMotionAvailable == true {
                print("motion detected")
                let q = OperationQueue()
                manager.deviceMotionUpdateInterval = 0.2
                manager.startDeviceMotionUpdates(to: q) {
                    (data: CMDeviceMotion?, error: Error?) in
                    if let mydata = data {
//                        print("mydata", mydata.attitude)
//                        print("pitch", mydata.attitude.pitch)
//                        print("roll", mydata.attitude.roll)
//                        print("yaw", mydata.attitude.yaw)

                        
                        self.shipSpeed = (mydata.attitude.roll + (Double.pi / 2.5)) * 750
                        
                        
                        let tolerance = 0.2
                        self.turnSpeed = 0
                        if abs(mydata.attitude.pitch) > tolerance{
                            if mydata.attitude.pitch > 0{
                                self.turnSpeed = (mydata.attitude.pitch - tolerance) * -0.25
                            }
                            else{
                                self.turnSpeed = (mydata.attitude.pitch + tolerance) * -0.25
                            }
                            
                        }
                       
                    }
                }
                
            } else {
                print("probably in simulator")
            }
        } else {
            print("NO Motion Manager Found")
        }
        
        
    }
    
    
    
    
    func spawnBullets() {
        var bullet = SKSpriteNode(imageNamed: "silverBullet-1")
        bullet.size.width = 10
        bullet.size.height = 20
        bullet.position = CGPoint(x: player.position.x + (player.physicsBody?.velocity.dx)!*30/CGFloat(shipSpeed), y: player.position.y + (player.physicsBody?.velocity.dy)!*30/CGFloat(shipSpeed))
//        bullet.position = CGPoint(x: player.position.x, y: player.position.y)
        
        
        let bulletPhysics = SKPhysicsBody(rectangleOf: CGSize(width: bullet.size.width, height: bullet.size.height))
        let bulletSpeed: CGFloat = 750
        bulletPhysics.isDynamic = true
        bulletPhysics.categoryBitMask = bulletCategory
        bulletPhysics.contactTestBitMask = asteroidCategory
        bulletPhysics.collisionBitMask = asteroidCategory
        bulletPhysics.allowsRotation = false
        bulletPhysics.affectedByGravity = false
        bulletPhysics.friction = 0
        bulletPhysics.restitution = 0
        bulletPhysics.velocity = CGVector(dx: (player.physicsBody?.velocity)!.dx * bulletSpeed / CGFloat(shipSpeed), dy: (player.physicsBody?.velocity)!.dy * bulletSpeed / CGFloat(shipSpeed))
        bullet.physicsBody = bulletPhysics
        bullet.zRotation = player.zRotation
        
        
        
        
        
//        let action = SKAction.moveTo(y: self.size.height, duration: 0.6)
//        bullet.run(SKAction.repeatForever(action))
        
        self.addChild(bullet)
    }
    // create function to add more bullets :)
    
    
    // create asteroid spawn
    func addAsteroid () {
        
        possibleAsteroids = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: possibleAsteroids) as! [String]
        let asteroid = SKSpriteNode(imageNamed: possibleAsteroids[0])
        let randomAsteroidPosition = GKRandomDistribution(lowestValue: 0, highestValue: Int(self.frame.maxX))
        let position = CGFloat(randomAsteroidPosition.nextInt())
        asteroid.position = CGPoint(x: position, y: self.frame.size.height + asteroid.size.height)
        asteroid.physicsBody = SKPhysicsBody(rectangleOf: asteroid.size)
        asteroid.physicsBody?.isDynamic = true
        asteroid.physicsBody?.categoryBitMask = asteroidCategory
        asteroid.physicsBody?.contactTestBitMask = bulletCategory
        asteroid.physicsBody?.collisionBitMask = bulletCategory
        self.addChild(asteroid)
        let animationDuration:TimeInterval = 10
        var actionArray = [SKAction]()
        actionArray.append(SKAction.move(to: CGPoint(x: position, y: -asteroid.size.height), duration: animationDuration))
        actionArray.append(SKAction.removeFromParent())
        asteroid.run(SKAction.sequence(actionArray))
        
    }
    
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        var angle =  Double(player.zRotation)
        
        angle += turnSpeed
        
        player.physicsBody?.velocity = CGVector(dx: sin(-1*angle) * shipSpeed, dy: cos(-1*angle)*shipSpeed)
        player.zRotation += CGFloat(turnSpeed)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        contact.bodyA.node?.removeFromParent()
        contact.bodyB.node?.removeFromParent()
        print("contact")
    }
    
}
