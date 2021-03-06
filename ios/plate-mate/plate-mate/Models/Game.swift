//
//  Game.swift
//  plate-mate
//
//  Created by Henry Harris on 8/19/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import Foundation
import CoreData

func loadPlates() -> [Plate] {
    let mainContext = CoreDataManager.shared.mainContext
    let fetchRequest: NSFetchRequest<Plate> = Plate.fetchRequest()
    do {
        let results = try mainContext.fetch(fetchRequest)
        
        print(results)
        
        return results
    }
    catch {
        debugPrint(error)
    }
    
    return []
}

class MyGame {
    var name: String
    var plates: [MyPlate]
    var updatedAt: Date
    
    init(name: String) {
        self.name = name
        self.plates = plateData
        self.updatedAt = Date()
    }
    
    var updatedAtString: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "en_US")
        formatter.setLocalizedDateFormatFromTemplate("MMddYYYY")
        
        return formatter.string(from: updatedAt)
    }
}
