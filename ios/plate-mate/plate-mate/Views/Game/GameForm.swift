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
    
    @State var game: Game? = nil
    @State var create: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
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
        .navigationBarItems(trailing: Button("Save") {
            game = createGame()
        })
        
//        if (create) {
//            NavigationLink(destination: GameList(), isActive: $create) {
//                EmptyView()
//            }
//        }
    }
    
    
    func createGame() -> Game {
        print("Creating game")
        create = true
        presentationMode.wrappedValue.dismiss()
        return saveGame(name: name)
    }
}

struct GameForm_Previews: PreviewProvider {
    static var previews: some View {
        GameForm()
    }
}
