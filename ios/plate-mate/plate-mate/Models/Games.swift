//
//  Games.swift
//  plate-mate
//
//  Created by Henry Harris on 2/21/21.
//  Copyright © 2021 Henry Harris. All rights reserved.
//

import Foundation

class Games: ObservableObject{
    @Published var games: [Game]

    init(games: [Game]) {
        self.games = games
        sort()
    }
    
    func addGame(game: Game) {
        games.insert(game, at: 0)
    }
    
    func sort() {
        games = games.sorted(by: { $0.updatedAt! > $1.updatedAt! })
    }
}
