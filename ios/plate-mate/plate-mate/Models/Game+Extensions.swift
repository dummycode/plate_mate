//
//  Game+Extensions.swift
//  plate-mate
//
//  Created by Henry Harris on 8/21/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import Foundation
import CoreData

extension Game: Identifiable {
    var updatedAtString: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "en_US")
        formatter.setLocalizedDateFormatFromTemplate("MMddYYYY")
        
        return formatter.string(from: updatedAt!)
    }
}

extension Game {

    @objc(addPlates:)
    @NSManaged public func addToPlates(_ values: NSSet)

    @objc(removePlates:)
    @NSManaged public func removeFromPlates(_ values: NSSet)

}


func loadGames() -> [Game] {
    let mainContext = CoreDataManager.shared.mainContext
    let fetchRequest: NSFetchRequest<Game> = Game.fetchRequest()
    do {
        let results = try mainContext.fetch(fetchRequest)
        
        return results
    }
    catch {
        debugPrint(error)
    }
    
    return []
}

func saveGame(name: String) {
    let game = Game(context: CoreDataManager.shared.mainContext)
    game.name = name
    game.updatedAt = Date()
    
    let plates: [Plate] = plateData
    
    plates.forEach { plate in
        game.addToPlates(plate)
    }
    
    do {
        try CoreDataManager.shared.mainContext.save()
    } catch {
        print("Error saving game")
    }
}
