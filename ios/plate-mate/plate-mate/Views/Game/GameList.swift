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
                .onDelete(perform: deleteGameAtIndex)
            }
            .navigationBarTitle(Text("Games"))
            .navigationBarItems(trailing: NavigationLink(destination: GameForm(games: games)) {
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
    
    func deleteGameAtIndex(at offsets: IndexSet) {
        let gamesToDelete = offsets.map { games.games[$0] }
        games.games.remove(atOffsets: offsets)
        
        // Delete from core data
        gamesToDelete.forEach { game in
            deleteGame(game: game)
        }
    }
}

struct GameList_Previews: PreviewProvider {
    static var previews: some View {
        GameList()
    }
}

