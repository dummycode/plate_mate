//
//  GameList.swift
//  plate-mate
//
//  Created by Henry Harris on 8/19/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import SwiftUI

struct GameList: View {
    @ObservedObject var games: Games = Games(games: loadGames())
    
    var body: some View {
        NavigationView {
            List {
                ForEach(games.games) { game in
                    self.makeGameRow(game: game)
                }
                .onDelete(perform: deleteGame)
            }
            .navigationBarTitle(Text("Games"))
            .navigationBarItems(trailing: NavigationLink(destination: GameForm()) {
                    Text("New")
                }
            )
        }
    }
    
    func makeGameRow(game: Game) -> some View {
        return
            NavigationLink(destination: GameView(game: game)) {
                GameRow(game: game)
            }
    }
    
    func deleteGame(at offsets: IndexSet) {
        let gamesToDelete = offsets.map { games.games[$0] }
        games.games.remove(atOffsets: offsets)
        
        // Delete from core data
        do {
            try gamesToDelete.forEach { game in
                print(game)
                CoreDataManager.shared.mainContext.delete(game)
                try CoreDataManager.shared.mainContext.save()
                print(loadGames())
            }
        } catch {
            print("Error deleting game")
        }
    }
}

struct GameList_Previews: PreviewProvider {
    static var previews: some View {
        GameList()
    }
}

