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
    
    var paddle = SKSpriteNode()
    var token = SKSpriteNode()
    var player = SKSpriteNode()
    
    //basics inclusive the moving token
    //TODO: add optional binding
    override func didMove(to view: SKView) {
        paddle = self.childNode(withName: "paddle") as! SKSpriteNode //spritenodes have more functions than nodes --> better for games
        token = self.childNode(withName: "token") as! SKSpriteNode
        player = self.childNode(withName: "player") as! SKSpriteNode
        
        
        token.physicsBody?.applyImpulse(CGVector(dx: 20,dy: 20))
        
            let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
      
    }
    
    //let the player paddle move with the use of a finger
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        fingerMovement(touches: touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        fingerMovement(touches: touches)
    }

    override func update(_ currentTime: TimeInterval) {
        // enemy paddle following the token a little bit delayed
        
        paddle.run(SKAction.moveTo(x: token.position.x , duration: 1.0)) // 1.0 = 1 sek, 0.5 would be way harder to play
    }
    
    func fingerMovement(touches:  Set<UITouch>){
        for singleTouch in touches{
            let fingerPosition = singleTouch.location(in: self)
            
            player.run(SKAction.moveTo(x: fingerPosition.x , duration: 0.0))
        }
    }
}
