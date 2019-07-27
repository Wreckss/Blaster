//
//  GameScene.swift
//  Blaster
//
//  Created by taco on 7/26/19.
//  Copyright © 2019 tacoTruck. All rights reserved.
//

import SpriteKit

enum CollisionType: UInt32 {
    case player = 1
    case playerWeapon = 2
    case enemy = 4
    case enemyWeapon = 8
}
class GameScene: SKScene {
    let player = SKSpriteNode(imageNamed: "player")
    let waves = Bundle.main.decode([Wave].self, from: "waves.json")
    let enemyTypes = Bundle.main.decode([EnemyType].self, from: "enemy-types.json")

    override func didMove(to view: SKView) {
        
     
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
        
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.texture!.size())
        player.physicsBody?.categoryBitMask = CollisionType.player.rawValue
        player.physicsBody?.collisionBitMask = CollisionType.enemy.rawValue | CollisionType.enemyWeapon.rawValue
        //this line will tell us that the player has been hit by
        player.physicsBody?.contactTestBitMask = CollisionType.enemyWeapon.rawValue | CollisionType.enemyWeapon.rawValue
        player.physicsBody?.isDynamic = false //turns off player gravity
    }
}
