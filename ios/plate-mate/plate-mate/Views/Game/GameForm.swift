//
//  GameForm.swift
//  plate-mate
//
//  Created by Henry Harris on 8/20/20.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import SwiftUI

struct GameForm: View {
    @State var name: String = ""
    @State var usa: Bool = true
    @State var canada: Bool = false
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            Toggle(isOn: $usa) {
                Text("United States")
            }
            .disabled(true)
            Toggle(isOn: $canada) {
                Text("Canada")
            }
        }
        .navigationBarTitle("New Game")
        .navigationBarItems(trailing: NavigationLink(destination: PlateList(title: name, plates: [])) {
                Button("Save") {
                    self.createGame()
                    PlateList(title: self.name, plates: []).transition(.scale)
                }
            }
        )
    }
    
    func createGame() {
        print("Creating game")
        saveGame(name: name)
    }
}

struct GameForm_Previews: PreviewProvider {
    static var previews: some View {
        GameForm()
    }
}
