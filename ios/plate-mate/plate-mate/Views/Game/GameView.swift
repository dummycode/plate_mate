//
//  PlateList.swift
//  plate-mate
//
//  Created by Henry Harris on 2/21/21.
//  Copyright © 2020 Henry Harris. All rights reserved.
//

import SwiftUI
import Combine

struct GameView: View {
    @State var game: Game
    @State var text: String = ""
    @State private var isEditing = false
    @State var showSeen = false
    @State var changed = 0
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search...", text: $text)
                    .padding(2.5)
                    .padding(.horizontal, 10)
                    .background(Color(.systemGray6))
                    .cornerRadius(6)
                    .padding(.leading, 10)
                    .padding(.trailing, isEditing ? 0 : 10)
                    .onTapGesture {
                        self.isEditing = true
                    }
                    .transition(.move(edge: .trailing))
                    .animation(.default)
    
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.text = ""
                        self.hideKeyboard()
                    }) {
                        Text("Cancel")
                    }
                    .padding(.trailing, 10)
                    .padding(.leading, 0)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
               }
            }
            
            HStack {
                Toggle(isOn: $showSeen, label: {
                    Text("Show Seen")
                })
                .padding(.horizontal, 10)
            }
            
            if game.plates!.filter { !seen(plate: $0 as! Plate) }.count > 0 || showSeen {
                PlateList(plates: (game.plates?.array ?? []) as! [Plate], text: $text, showSeen: $showSeen, changed: $changed)
            } else {
                Spacer()
                Text("Wow! You've seen them all!")
                Spacer()
            }
            
        }
        .onTapGesture {
            self.isEditing = false
            self.hideKeyboard()
        }
        .navigationBarTitle(game.name!)
    }
    
    func seen(plate: Plate) -> Bool {
        return plate.seen
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = Game()
        game.plates = []
        game.name = "Preview Game"
        
        return GameView(game: game)
    }
}
