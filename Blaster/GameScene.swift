//
//  GameScene.swift
//  Blaster
//
//  Created by taco on 7/26/19.
//  Copyright © 2019 tacoTruck. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        let player = SKSpriteNode(imageNamed: "player")

        if let particles = SKEmitterNode(fileNamed: "Starfield") {
            particles.position = CGPoint(x: 1000, y: 0)
            particles.advanceSimulationTime(60) //this fast forwards the generation of the Starfield by 60sec
            particles.zPosition = -1
            addChild(particles)
        }
        
        player.name = "player"
        player.position.x = frame.minX + 75
        player.zPosition = 1
        addChild(player)
    }
}
