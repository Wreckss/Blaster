//
//  Bundle-Decoding.swift
//  Blaster
//
//  Created by taco on 7/26/19.
//  Copyright © 2019 tacoTruck. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T   {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
