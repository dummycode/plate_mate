//
//  Plate.swift
//  plate-mate
//
//  Created by Henry Harris on 8/18/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import Foundation
import SwiftUI

let plateData: [Plate] = load("plates.json")

class Plate: Codable, Identifiable {
    var name: String
    var asset: String
    
    var image: Image {
        Image("plates/" + asset)
    }
    
    init(name: String, asset: String) {
        self.name = name
        self.asset = "plates/" + asset
    }
}
