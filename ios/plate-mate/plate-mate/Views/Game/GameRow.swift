//
//  GameRow.swift
//  plate-mate
//
//  Created by Henry Harris on 8/19/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import SwiftUI

struct GameRow: View {
    var game: Game
    
    var body: some View {
        HStack {
            Text(game.name)
            Spacer()
            Text(game.updatedAtString)
        }
        .padding(10)
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameRow(game: Game(name: "Road Trip"))
    }
}
