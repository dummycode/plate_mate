//
//  Plate.swift
//  plate-mate
//
//  Created by Henry Harris on 8/18/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import Foundation
import SwiftUI

let plateData: [MyPlate] = load("plates.json")

class MyPlate: Codable, Identifiable {
    var name: String
    var asset: String
    var seen: Bool
    
    var image: Image {
        Image("plates/" + asset)
    }
    
    init(name: String, asset: String) {
        self.name = name
        self.asset = "plates/" + asset
        self.seen = false
    }
}
