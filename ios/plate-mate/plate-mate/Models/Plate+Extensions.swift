//
//  Game+Extensions.swift
//  plate-mate
//
//  Created by Henry Harris on 8/21/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

extension Plate {
    var image: Image {
        Image("plates/" + (imageName ?? ""))
    }
}

func createPlate(name: String, imageName: String) -> Plate {
    let plate = Plate(context: CoreDataManager.shared.mainContext)
    
    plate.name = name
    plate.imageName = imageName
    plate.seen = false
    
    return plate
}

func savePlate(name: String, imageName: String) -> Plate {
    let plate = createPlate(name: name, imageName: imageName)
    
    do {
        try CoreDataManager.shared.mainContext.save()
    } catch {
        print("Error saving plate")
    }
    
    return plate
}
