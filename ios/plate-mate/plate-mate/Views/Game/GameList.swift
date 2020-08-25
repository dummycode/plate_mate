//
//  GameList.swift
//  plate-mate
//
//  Created by Henry Harris on 8/19/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import SwiftUI

struct GameList: View {
    @State var games: [Game] = loadGames()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(games) { game in
                    self.makeGameRow(game: game)
                }
                .onDelete(perform: deleteGame)
            }
            .navigationBarTitle(Text("Games"))
            .navigationBarItems(trailing:           NavigationLink(destination: GameForm()) {
                    Text("New")
                }
            )
        }
    }
    
    func makeGameRow(game: Game) -> some View {
        let plates = game.plates!.array as? [Plate]
        return
            NavigationLink(destination: PlateList(title: game.name!, plates: plates ?? [])) {
                GameRow(game: game)
            }
    }
    
    func deleteGame(at offsets: IndexSet) {
        let gamesToDelete = offsets.map { self.games[$0] }
        games.remove(atOffsets: offsets)
        
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

