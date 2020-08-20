//
//  GameList.swift
//  plate-mate
//
//  Created by Henry Harris on 8/19/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import SwiftUI

struct GameList: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: PlateList()) {
                    GameRow(game: Game(name: "At Home"))
                }
                GameRow(game: Game(name: "Alaska Road Trip"))
            }
            .navigationBarTitle(Text("Games"))
            .navigationBarItems(trailing:           NavigationLink(destination: GameForm()) {
                    Text("New")
                }
            )
        }
    }
}

struct GameList_Previews: PreviewProvider {
    static var previews: some View {
        GameList()
    }
}

