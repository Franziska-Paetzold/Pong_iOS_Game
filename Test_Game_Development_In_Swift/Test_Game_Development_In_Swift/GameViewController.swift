//
//  GameViewController.swift
//  Test_Game_Development_In_Swift
//
//  Created by Franziska Pätzold on 16.05.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                //some more configurations for the scene
              //  scene.backgroundColor = SKColor.cyan;
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
        }
    }

    override var shouldAutorotate: Bool {
        return false;
    }

    //TODO: is portrait enough?
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
