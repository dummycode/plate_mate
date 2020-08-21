//
//  GameList.swift
//  plate-mate
//
//  Created by Henry Harris on 8/19/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import SwiftUI

struct GameList: View {
    var games: [Game] = loadGames()
    var body: some View {
        NavigationView {
            List {
                ForEach(games) { game in
                    self.makeGameRow(game: game)
                }
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
}

struct GameList_Previews: PreviewProvider {
    static var previews: some View {
        GameList()
    }
}

