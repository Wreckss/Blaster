//
//  EnemyNode.swift
//  Blaster
//
//  Created by taco on 7/26/19.
//  Copyright © 2019 tacoTruck. All rights reserved.
//

import SpriteKit

class EnemyNode: SKSpriteNode {
    let type: EnemyType
    var lastFireTime: Double = 0
    var shields: Int
    
    init(type: EnemyType, startPosition: CGPoint, xOffest: CGFloat, moveStraight: Bool) {
        self.type = type
        shields = type.shield
        
        let texture = SKTexture(imageNamed: type.name)
        super.init(texture: texture, color: .white, size: texture.size())
        
        physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        physicsBody?.categoryBitMask = CollisionType.enemy.rawValue
        physicsBody?.collisionBitMask = CollisionType.player.rawValue | CollisionType.playerWeapon.rawValue
        physicsBody?.contactTestBitMask = CollisionType.player.rawValue | CollisionType.playerWeapon.rawValue
        
        name = "enemy"
        position = CGPoint(x: startPosition.x + xOffest, y: startPosition.y)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("wtf")
    }
    
    
}
