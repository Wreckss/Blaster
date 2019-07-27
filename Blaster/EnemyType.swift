//
//  EnemyType.swift
//  Blaster
//
//  Created by taco on 7/26/19.
//  Copyright © 2019 tacoTruck. All rights reserved.
//

import SpriteKit

struct EnemyType: Codable {
    let name: String
    let shield: Int
    let speed: CGFloat
    let powerUpChance: Int
}
