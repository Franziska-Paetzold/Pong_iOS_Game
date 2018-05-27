//
//  GameScene.swift
//  Test_Game_Development_In_Swift
//
//  Created by Franziska Pätzold on 16.05.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var paddle2 = SKSpriteNode()
    var token = SKSpriteNode()
    var player = SKSpriteNode()
    
    //add optional binding
    override func didMove(to view: SKView) {
        paddle2 = self.childNode(withName: "paddle") as! SKSpriteNode //spritenodes have more functions than nodes --> better for games
        token = self.childNode(withName: "token") as! SKSpriteNode
        player = self.childNode(withName: "player") as! SKSpriteNode
        
        
        token.physicsBody?.applyImpulse(CGVector(dx: 20,dy: 20))
        
            let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
      
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
