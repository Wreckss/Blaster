//
//  Wave.swift
//  Blaster
//
//  Created by taco on 7/26/19.
//  Copyright © 2019 tacoTruck. All rights reserved.
//

import SpriteKit

struct Wave: Codable {
    struct WaveEnemy: Codable {
        let position: Int
        let xOffset: CGFloat
        let moveStraight: Bool
    }
    
    let name: String
    let enemies: [WaveEnemy]
}
