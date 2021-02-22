//
//  GameCodable.swift
//  plate-mate
//
//  Created by Henry Harris on 2/21/21.
//  Copyright © 2021 Henry Harris. All rights reserved.
//

import Foundation


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
