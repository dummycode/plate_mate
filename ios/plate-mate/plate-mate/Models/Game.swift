//
//  Game.swift
//  plate-mate
//
//  Created by Henry Harris on 8/19/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import Foundation

class Game: Codable, Identifiable {
    var name: String
    var plates: [Plate]
    var updatedAt: Date
    
    init(name: String) {
        self.name = name
        self.plates = plateData
        self.updatedAt = Date()
    }
    
    var updatedAtString: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter.string(from: updatedAt)
        
    }
}
