//
//  Game+Extensions.swift
//  plate-mate
//
//  Created by Henry Harris on 8/21/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import Foundation
import CoreData

extension Game {
    var updatedAtString: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "en_US")
        formatter.setLocalizedDateFormatFromTemplate("MMddYYYY")
        
        return formatter.string(from: self.updatedAt!)
    }
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

func saveGame(name: String) -> Game {
    let game = Game(context: CoreDataManager.shared.mainContext)
    game.name = name
    game.updatedAt = Date()
    
    let plates: [Plate] = plateData.map { $0.copy() }
    
    plates.forEach { plate in
        game.addToPlates(plate)
    }
    
    do {
        try CoreDataManager.shared.mainContext.save()
    } catch {
        print("Error saving game")
    }
    
    return game
}

func deleteGame(game: Game) {
    CoreDataManager.shared.mainContext.delete(game)
    do {
        try CoreDataManager.shared.mainContext.save()
    } catch {
        print("Error deleting game")
    }
}
