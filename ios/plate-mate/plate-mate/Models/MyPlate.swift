//
//  Plate.swift
//  plate-mate
//
//  Created by Henry Harris on 8/18/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import Foundation
import SwiftUI

let codablePlateData: [CodablePlate] = load("plates.json")

let plateData: [Plate] = codablePlateData.map { codablePlate in
    let plate = createPlate(name: codablePlate.name, imageName: codablePlate.asset)
    
    return plate
}

class CodablePlate: Codable {
    var name: String
    var asset: String
    
    init(name: String, asset: String) {
        self.name = name
        self.asset = asset
    }
}
